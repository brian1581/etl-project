# Project Proposal

## What data sources are you using?
* Data.World – IRS income by Zip

* Data.World – Zillow Data (Median Home Listing Prices)

## What’s the end product you want to create?
Determine which location will allow you to take your AGI (adjusted gross income) the furthest to purchase a home.  

Calculations - How may year’s salary to buy a house?

Rank of top ten places with high AGIs and modest home listing prices based on calculations.

## How will you store it?
The data is stored in CSV files, which will be accessed and cleaned using pandas. We will store resulting tables in a Postgres SQL DB.   

## How will you transform the data?
We'll need to drop duplicates, rename columns, tranform month columns into rows for years, join on zip codes.

## What additional challenges will you give yourself if you have time?
Attempt to also create a MongoDB