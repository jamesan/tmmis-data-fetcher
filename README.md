# TMMIS data fetcher

A bash shell script to fetch data from the Toronto Meeting Management Information System (TMMIS).

**Requires curl.**

## Preamble

This work sprung from the TTC group at the Open Data Day Toronto 2014 (#ODDTO14) that formed on Sat., Feb. 22, 2014. The scope of work required data on the voting records of Toronto's city councillors and the only public-accessible means to access those records is using the TMMIS website. In an attempt to fully automate this, the needed HTTP endpoints and parameters were mapped out enough to fetch the required data.

## TMMIS HTTP API Reference

The base URL for all API endpoints is: http://app.toronto.ca/tmmis.

### /getAdminReport.do

Reports on city council meetings. This endpoint responds to POST and GET requests in the same way and is used to generate city council and committee meeting schedules, council/committee member attendance and voting records. It can also return HTML forms used to make those POST requests.

**Note**: all parameters are treated the same regardless of whether their sent in the request body or the query string.

#### Parameters (incomplete)

Parameter | Type | Description
----------|------|------------
function | enum | getMemberVoteReport
download | enum | csv
termId | int | ID number of the city council term, where the current term has an ID of 4
decisionBodyId | int | ID number of the committee, where council has an ID of 0 
fromDate | date | Formatted as YYYY-MM-DD, e.g. 2014-02-01
toDate | date | Formatted as YYYY-MM-DD, e.g. 2014-03-01
memberId | int | ID number of the council/committee member

