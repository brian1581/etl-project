# ETL Project
## Brian Abbe & Andrew Eckes

## Summary

Our team decided that we were interested in exploring some kind of financial data. After finding an IRS dataset from data.world that contained adjusted gross income by zip code, we thought it might be interesting to find another dataset with zip codes as a way to eventually compare some sort of financial health or interesting home value metric related to specific regional areas.

We found that Zillow has a number of datasets available for public consumption on data.world.  We figured this could potentially help us answer questions about how affordable homes were in certain areas in relation to incomes in that zip code.

***

## Extract

### Data.World – IRS income by Zip - CSV
This CSV dataset contains records for adjusted gross income (AGI) and many other data points for taxpayers in each zip code.  Some zip codes were grouped in the dataset by the provider where the number of returns was very small, designated by the zip code 99999. State subtotals were denoted by 00000 zip code. 

The available IRS datasets we found only went to 2016, so we chose that since it was the most recent available.  There were also six tax brackets (six rows) for each zip code that would need to be aggregated to get a total agi per zip.

We also found this dataset and additional documentation on the IRS.gov website.


### Data.World – Zillow Data (Median Home Listing Prices) - CSV
This CSV dataset contains the median home listing price for zip codes that Zillow monitors, from 2010-2017.
There are twelve-month columns for each year, and the rows contain the monthly median listing price data for each zip.

***

## Transform
Since we only had IRS income data for 2016, we decided to drop the other years from the Zillow dataset and average the columns for 2016 to get a single '2016 average' column.

IRS:
1) Download .zip, extract .csv
2) Load .csv into dataframe
3) Filter out rows where zip code is 00000 or 99999 - these are special categories, not specific zip codes
4) Pare down irrelevant columns, keep zip code (cast as string), A00100 which was our AGI data (cast as string to get area codes like 00001 to display correctly)
5) Renamed zip code column to match Zillow dataset column name for zip code
6) Grouped AGI by zip code and aggregated all six tax brackets to get a total AGI per zip code
7) Cast the aggregated AGI as integer
8) Set index as zip code

Zillow: 
1) Download .zip, extract .csv
2) Load .csv into dataframe
3) Slice dataframe to include only months from 2016, zip code, and state fields.
4) Replace blank/missing home listing values w/ 0
5) Create an average column to get the 2016 average by zip
6) Convert home value listings to integers (from float)

***

## Load
We created a Postgres database and defined a table schema to store the IRS data and the Zillow data.  Once the database was ready, we ran the final cells of our notebook to insert the data into the database via SQLalchemy.

Once we had the two tables joined by zip code, we created a few views that could be used later.  One view we created was a high income, low house listing set.  On a cursory check of this data, there were lots of suburban Texas (oil incomes?) zips. We also created an inverse view to look at low income, high listing price zips and the results seemed appropriate; many New York and other coastal-state zip codes.

***

## Lessons learned
A few of the AGI values that we spot checked looked exorbitantly high - we came to the conclusion that this data might include business filings as well for it to be so high, or the highest tax brackets skew the total AGI for the zip.

We could ask many questions about this data:

1) How much are the higher tax brackets influencing the total agi for the zip?
2) Could retirees be skewing the numbers in areas like Florida and California where they might have lower incomes, but higher home price listings?
