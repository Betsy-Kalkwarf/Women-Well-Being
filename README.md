# Women's Well-Being

## Cleaning Data
- Loaded original CSV file into Dataframe consisting of 7370 rows x 407 columns ([Data source:](https://www.kaggle.com/datasets/konradb/wellbeing-of-women-in-52-countries?resource=download) [csv](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/main/Resources/livwell_lin_interpolated.csv))
- Extracted Domestic Violence and Education columns
- Grouped data by "Country Name"
- Saved to [dv_edu.csv](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/clean_data.csv) file

## Machine Learning
- Loaded [dv_edu.csv](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/clean_data.csv) file
- Dropped null values
- Created scatter plot based on Elbow Curve method to decide  best number for K-value
![scatter_plot](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/Images/scatter.png)
![elbow](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/Images/elbow.png)
- Scaled initial data
- Initialize PCA model to get two principal components for data
- Updated scatter plot based on new elbow curve and principal components
![scatter_pca](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/Images/scatter_pca.png)
![elbow_pca](https://github.com/Betsy-Kalkwarf/Women-Well-Being/blob/code/Images/elbow_pca.png)
