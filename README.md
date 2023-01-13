# Women-Well-Being

# Women-Well-Being - Livewell

## Database: RDS Setup and ETL process for country demographics.

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


## Machine Learning - Unsupervised
- Step 1: Added ML_Indicators.ipynb
- Step 2: Retrieved the datasource from remote database.
- Step 3: Converted the pySpark datframe to pandas.
- Step 4: Cleaned and created a new dataframe considering the means Indicators (22 columns/401 columns).
- Step 5: Set up the machine learning model.
- Step 6: Scaled the data.
- Step 7: Fit and transform the data.
- Step 8: Applied PCA for feature reduction.
- Step 9: Checked the elbow curve to find the best count of clusters for K-Means clustering.
![Elbow Curve K6](https://user-images.githubusercontent.com/111100908/210919519-61c83295-25d7-453d-b175-0ac028a9ed43.png)


- Step 10: Created a 3d scatter plot to check the clusters.
![PCA Clusters](https://user-images.githubusercontent.com/111100908/210919588-4998c04d-31e4-46e6-98f4-6b2beb9018a1.png)

## CSV generation methods:
      Step1 : Run the Analysis_startercode to generate the CountryDemographics.csv from the PostgresSQL.
      Step 2: Run the ML_Indictors jupyter notebook in google collab to generate the Livewell_Mean_Indicators CSV files from the datasources. This has included all the indictors that has mean. 
       
     As of now both the CSV files are uploaded into the branch for quick reference.


- Step 3:
=======
# Women's Well-Being

## Cleaning Data
- Loaded original CSV file into Dataframe consisting of 7370 rows x 407 columns ([Data source:](https://www.kaggle.com/datasets/konradb/wellbeing-of-women-in-52-countries?resource=download) [csv](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Resources/livwell_lin_interpolated.csv))
- Extracted Domestic Violence and Education columns
- Grouped data by "Country Name"
- Saved to [dv_edu.csv](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/dv_edu.csv) file


## Machine Learning
- Loaded [dv_edu.csv](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/dv_edu.csv) file
- Dropped null values
- Created scatter plot based on Elbow Curve method to decide  best number for K-value
- Scaled initial data
- Initialize PCA model to get two principal components for data
- Updated scatter plot based on new elbow curve and principal components

=======

## Reason why we selected our topic 
As women, we care about women's well-being and strive to figure out what aspects of life most impact if women live long and happy lives.

## Description of our source of data
"LivWell is a global longitudinal database which provides a range of key indicators related to women’s socioeconomic status, health and well-being, access to basic services, and demographic outcomes. Data are available at the sub-national level for 52 countries and 447 regions. A total of 134 indicators are based on 199 Demographic and Health Surveys for the period 1990-2019, supplemented by extensive information on socioeconomic and climatic conditions in the respective regions for a total of 190 indicators. The resulting data offer various opportunities for policy-relevant research on gender inequality, inclusive development, and demographic trends at the sub-national level." [Source]([url](https://www.kaggle.com/datasets/konradb/wellbeing-of-women-in-52-countries?resource=download))

## Questions we hope to answer with the data
- Do different aspects of life (education, household factors, precipitation, fertility, etc.) impact overall women's well-being in similar ways?
- As we advance through the years do we see an increase in healthier women?
- What is the relationship between women's well-being in countries with different levels of development?

## Description of the communication protocols
- Bi-weekly check-ins
- Betsy will approve items on Github
- We will communicate often over Slack

