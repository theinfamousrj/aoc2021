day=1
year=$(date +%Y)

while getopts d:y: flag
do
    case "${flag}" in
        d) day=${OPTARG};;
        y) year=${OPTARG};;
    esac
done

dayfix=$(printf "%02d" ${day})

echo "curling https://adventofcode.com/${year}/day/${day}/input"
echo "saving to ./day${dayfix}/input"

mkdir -p ./day${dayfix}

curl "https://adventofcode.com/${year}/day/${day}/input" \
-H "Referer: https://adventofcode.com/${year}/day/${day}" \
-H "Connection: keep-alive" \
-H "Cookie: _ga=GA1.2.93706315.1639417661; _gid=GA1.2.1515893530.1639417661; session=${ADVENT_OF_CODE_SESSION_COOKIE}" \
-H "Upgrade-Insecure-Requests: 1" \
-H "Sec-Fetch-Dest: document" \
-H "Sec-Fetch-Mode: navigate" \
-H "Sec-Fetch-Site: same-origin" \
-H "Sec-Fetch-User: ?1" \
-H "Cache-Control: max-age=0" \
-H "TE: trailers" \
> ./day${dayfix}/input