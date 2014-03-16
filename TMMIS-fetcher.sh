URI="http://app.toronto.ca/tmmis/getAdminReport.do"
PARAMS="function=getMemberVoteReport&download=csv&termId=4&decisionBodyId=0&fromDate=2014-02-01&toDate=2014-03-01"
memberIds=$(tail -n +2 wards-councillor-id-mapping.csv | cut -f4 -d',' | tr -d '"')

(
    rm --force vote-record-*.csv
    for memberId in $memberIds ; do
        curl --output vote-record-$memberId.csv --data $PARAMS\&memberId=$memberId $URI
        curl --output vote-record-$memberId.cs --request POST \
            --form 'function=getMemberVoteReport' \
            --form 'download=csv' \
            --form 'termId=4' \
            --form 'decisionBodyId=0' \
            --form 'fromDate=2014-02-01' \
            --form 'toDate=2014-03-01' \
            --form "memberId=$memberId" \
            $URI
    done
)
