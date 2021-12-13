day=1
year=$(date +%Y)
session=$ADVENT_OF_CODE_SESSION_COOKIE

while getopts d:y:s: flag
do
    case "${flag}" in
        d) day=${OPTARG};;
        y) year=${OPTARG};;
        s) session=${OPTARG};;
    esac
done

if [ -z "$session" ] 
then
    echo "Please either set the ADVENT_OF_CODE_SESSION_COOKIE environment variable or use the -s flag to pass in the session id"
else
    dayfix=$(printf "%02d" ${day})

    echo "curling https://adventofcode.com/${year}/day/${day}/input"
    echo "saving to ./day${dayfix}/input"

    mkdir -p ./day${dayfix}

    curl "https://adventofcode.com/${year}/day/${day}/input" \
    -H "Referer: https://adventofcode.com/${year}/day/${day}" \
    -H "Connection: keep-alive" \
    -H "Cookie: _ga=GA1.2.93706315.1639417661; _gid=GA1.2.1515893530.1639417661; session=${session}" \
    -H "Upgrade-Insecure-Requests: 1" \
    -H "Sec-Fetch-Dest: document" \
    -H "Sec-Fetch-Mode: navigate" \
    -H "Sec-Fetch-Site: same-origin" \
    -H "Sec-Fetch-User: ?1" \
    -H "Cache-Control: max-age=0" \
    -H "TE: trailers" \
    > ./day${dayfix}/input
fi