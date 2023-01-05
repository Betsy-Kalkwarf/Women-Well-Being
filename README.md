# Women-Well-Being - Livewell

## RDS Setup and ETL process for country demographics.

- Step1: Created a AWS database with postgres sql connection.
- Step2: Created S3 buckets and upoaded the following data sources.
       - 1) Country_GDP.csv
       - 2) Livwell_in_interpolated.csv
       - 3) world_country_and_usa_states_latitude_and_longitude_values.csv
- Step 3: Changed the visibility rules to public.
- Step 4: Created a PostgresSql databases that connects to the aws RDS.
- Step 5: Stored the connection string in the config.py
- Step 5: Created a schema for the CountryDemographics with the following fields (Women-Well-Being.sql):
        
```python
**      DROP TABLE IF EXISTS CountryDemographics;

        CREATE TABLE CountryDemographics (
        country_name character varying(50) NOT NULL,
        country_code character varying(5) NOT NULL,
        latitude FLOAT NOT NULL,
        longitude FLOAT NOT NULL,
        GDP FLOAT NOT NULL
        );**
```

- Step 6: Created a jupyter notebook Country_ETL.ipynb
- Step 7: Setup the pySpark session and postgresql.
- Step 8: Read the data from the aws database instance using Pyspark packages and load them into the dataframes.
- Step 9: Create a schema for country_df
   ```python
    schema = StructType([
  StructField("country_code", StringType(), False),  
  StructField("latitude", DoubleType(), True),
  StructField("longitude", DoubleType(), True),
  StructField("country_name", StringType(), False),
  ])
   ```
- Step 10: Rearrange the columns and drop the null values and store into another dataframe.
- Step 11: Read the Country_gdp and load it into the dataframe.
- Step 12: Dropped the not needed columns "Indicator name","Indicator Code".
- Step 13: Renamed the colummns "Country Name" and "Country Code" to "country_name" and "country_code".
- Step 14: Dropped the null values.
- Step 15: Calculated the average GDP of a country considering from the year 2000 till 2021 with row-wise aggregation and copied into a new dataframe.
- Step 16: Created the inner join considering the country name in both the data frames country and country gdp.
- Step 17: The resultant dataframe is uploaded into the database table in postgressql for further analysis with the livewell women well being dataset.

Added screenshot of database updations.
![Schema and table results](https://user-images.githubusercontent.com/111100908/210674327-ba064496-361c-4ee5-8bca-939dbfe21ea4.png)

- Step 18: Added Analysis_startercode.ipynb to get started with the cleaned country demographics.

