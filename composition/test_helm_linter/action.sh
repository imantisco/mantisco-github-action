DEFAULT_LOG_MODE=INFO
logMode="${1:-$DEFAULT_LOG_MODE}"
baseDir=$2

logger() {
    local LEVEL=$1
    local LEVEL_COLOR='\033[0;37m'
    local message=$2

    GREEN='\033[0;32m'
    GRAY='\033[0;90m'
    BLUE='\033[0;34m'
    RED='\033[0;31m'
    WHITE='\033[0;37m'

    case $LEVEL in
        INFO) LEVEL_COLOR="$BLUE" ;;
        DEBUG) LEVEL_COLOR="$GREEN" ;;
        WARNING) LEVEL_COLOR="$GRAY" ;;
        ERROR) LEVEL_COLOR="$RED" ;;
    esac

    if [ "$logMode" = "DEBUG" ]; then
        echo -e "${LEVEL_COLOR}$LEVEL${RESET} ${WHITE}$message${RESET}"
    elif [ "$LEVEL" != "DEBUG" ]; then
        echo -e "${LEVEL_COLOR}$LEVEL${RESET} ${WHITE}$message${RESET}"
    fi

}
listHelmChart() {
    # find . -maxdepth 2 -type f -name "Chart.yaml"                                               # ./har-w3c-event-watcher-svc/Chart.yaml
    # find . -maxdepth 2 -type f -name "Chart.yaml" -exec dirname {} \;                           # ./har-w3c-event-watcher-svc
    # find . -maxdepth 2 -type f -name "Chart.yaml" -exec dirname {} \; | xargs -I {} basename {} # har-w3c-event-watcher-svc
    local helmChartList=$(find . -maxdepth 2 -type f -name "Chart.yaml" -exec dirname {} \; | xargs -I {} basename {})
    echo $helmChartList
}
lintHelmChart() {
    local helmChart=$1
    logger INFO "$helmChart 검증 시작"

    __lint__() {
        local helmChart=$1
        logger DEBUG "$helmChart 기본 검증 시작"

        local manifestLines=$(helm lint "$(pwd)/$helmChart" --values "$(pwd)/$helmChart/values.yaml" | wc -l)
        if [ $manifestLines -eq 0 ]; then
            logger ERROR "$helmChart 기본 검증 실패"
            exit 127
        else
            logger INFO "$helmChart 기본 검증 성공"
        fi
    }
    __lintParams__() {
        local helmChart=$1
        local helmChartValuesFile=$2
        logger DEBUG "$helmChart/$helmChartValuesFile 검증 시작"

        local FILE_COUNT=$(find . -maxdepth 2 -name $helmChartValuesFile | grep -x "./$helmChart/$helmChartValuesFile" | wc -l)
        if [ $FILE_COUNT -eq 0 ]; then
            logger WARNING "$helmChart/$helmChartValuesFile 존재하지 않음"
        else
            local manifestLines=$(helm lint "$(pwd)/$helmChart" --values "$(pwd)/$helmChart/$helmChartValuesFile" | wc -l)
            if [ $manifestLines -eq 0 ]; then
                logger ERROR "$helmChart 기본 검증 실패"
                exit 127
            else
                logger INFO "$helmChart 기본 검증 성공"
            fi
        fi
    }


    __lint__ "$helmChart"
    __lintParams__ "$helmChart"
    __lintParams__ "$helmChart"
    __lintParams__ "$helmChart"

    logger INFO "$helmChart 검증 종료"
}

helmChartList=$(listHelmChart)
echo "helmChartList : $helmChartList"

for helmChart in $helmChartList
do
    lintHelmChart $helmChart
done