📝 Task List

<b>Data Validation</b>

The dataset contains 15000 rows and 8 columns before cleaning and validation. I have validated all the columns against the criteria in the dataset table:

•	week: Numeric values of count of weeks since product was launched, ranging from 1 to 6, matching the description given. There were no missing values. No changes were made to this column.

•	sales_method: This column contains sales method used for that customer. There should be 3 categories: "Call", "Email" or "Email + Call". But there were other values: "em + call" (23 records) and "email"(10 records). I used the find and replace feature in Excel to replace all values of "em + call" to "Email + Call" and "email" to "Email". There were no missing values.

•	customer_id: This column contains an id unique to the customer. There were no duplicates thus all were unique values, matching the description. There were no missing values. No changes were made.

•	nb_sold: This column contains numeric values of number of new products sold, without missing values, matching description. No changes were made to this column.

•	revenue: The values in this column were numeric, but there were missing values (NA, 1074 records). Also, not all values were rounded to 2 decimal places. Since the proportion of missing data is relatively small (7.16%) and all other data associated to the customer was present, I chose imputation method using the mean of available data, as it would not significantly bias the results. So I calculated the mean which was 93.93494255. Then used the find and replace feature in Excel to replace the missing values with the mean. I then rounded the values to 2 decimal places.

•	years_as_customer: This column contains numeric values of the number of years that customer has been buying. Since the company was founded in 1984, the value should not exceed 40. 2 records had values exceeding 40 (47, 63). Since this does not match the description, these 2 records were deleted. There were no missing values.

•	nb_site_visits: This column contains numeric values without missing data, matching the description. No changes were made.

•	state: This column contains the location of the customer without missing values, matching the description. No changes were made.

After the data validation, the dataset contains 14998 rows and 9 columns without missing values.

<b>How many customers were there for each approach?</b>

Targeted Email sales strategy is the best-selling technique, followed by targeted Phone Calls. As we can see from the graph below, there is a huge difference in number of customers between targeted email and phone calls approaches to combining the two.

 ![Picture1](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/6273870d-9ba6-461a-8304-cc9d5572ef8a)


To get further understanding of the customers, I decided to look at how the number of customers has been changing for each sales method over the last 6 weeks. We can see the percentage of number of customers over the weeks since product launch has been consistently increasing for Email + Call sales approach, unlike other sales method. Email sales method has consistently while Calls approach has fluctuated.

 ![Sheet 3 (1)](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/890027ad-de79-4761-9f67-3730826fa043)


Additionally, I decided to look at customer engagement. Looking at the graph below, we can see that new customers visit the website more often, buy more often and also bring the most revenue from the sales.

 ![Dashboard 1 (3)](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/512d0c39-69e5-4d40-ac08-08126a649176)

Therefore, focus should continue to be on the recent customers to increase sales for the new products.

<b>What does the spread of the revenue look like overall?</b>

Looking at the histogram below, we can see the non-symmetric shape. The data is spread out, which indicates a wide variation in revenue amounts. Overall, revenue from the sales is majorly less that 107.50. The revenue mostly lies in the range of 24.40 to 51.60, and 81.70 to 107.50. It also spikes a little in the range of 176.30 to 189.20, and 223.60 to 227.90. These spikes represent less frequent but notable revenue amounts.

 ![Dashboard 2](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/bde143f0-85bd-49d8-a30b-104630fa3520)

In summary, the histogram suggests a diverse revenue profile, heavily supported by a broad base of lower to mid-range sales while also benefiting from the occasional high-value transactions. The spread in revenue indicates a healthy, multi-tiered market approach, appealing to various customer segments.


![Picture2](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/be72ca5e-e7b5-4afe-9a1c-88ed056aa836)
 
This can also be seen in the box and whisker plot above. The median is closer to the box's lower values.


<b>Spread of the revenue for each method?</b>

From the multiple boxplots below, we can see the revenue range in Email + Call sales method is more significant than other methods. Majority of revenue from Email + Call sales method range from 149.79 to 189.55, which is higher than Email sales method and Call sales method. We can also see there is an outlier for Call sales method.

 ![Picture3](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/10864a8d-c799-4ce3-b27e-386994f1ad97)

Therefore, we can see, as much as Email + Call sales method brings less number of customers, its the biggest contributor to the high - value sales.


<b>Was there any difference in revenue over time for each of the methods?</b>

Looking at the revenue trend for the sales methods for the last 6 weeks, Call sales approach contribute the least revenue from the sales through the period. Although Email sales approach was initially the biggest contributor, we can see a decline over time. Email + Call approach has been picking up over time and has become the biggest contributor to revenue.
 
![Dashboard 1 (1)](https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/51d7f061-e42e-4610-8653-35bfda98a5d3)

Overall, revenue has been fluctuating, with week 6 bringing in the least revenue.


<b>Business Metrics</b>

Our goal is to use the best technique to sell the new product effectively. So, my objective is to evaluate the performance of the three different sales methods (Email, Call, Email and Call) for a new line of office stationery products and decide on the best method to use.
To achieve this, I recommend we use the percentage of total revenue over the weeks since the product launch for each sales method and Percentage of Number of customers over the weeks since the product launch for each sales method as our metrics.

Based on our last 6 weeks data, in the last week, 68.41% of total revenue is from Email + Call sales approach. This number has been consistently increasing on weekly basis unlike other approaches, from the initial 6.29%, making the approach the largest contributor to revenue as at last week. For Email approach, the initial percentage of total revenue was 84.23% and it has been reducing hitting 14.36% as at last week. For Call approach, it’s been significantly low since the launch and has fluctuated, from the initial 9.48% to 17.22% as at last week.

Also, based on the data, the percentage of number of customers over the weeks since product launch has been consistently increasing for Email + Call sales approach, hitting 47.48% as at last week from the initial 3.98%, unlike other sales method. Email sales method has consistently reduced from the initial 75.65% to 16.04% as at last week. Calls approach has fluctuated from the initial 20.37% to 36.48% as at last week.


<b>Recommendation</b>

•	After my analysis, I would recommend we can focus on the following steps:

•	Using key metrics to monitor how performance of the Sales methods changes over the coming weeks.

•	Focus on Email + Call sales approach to sell the new product effectively. This is based on my analysis where we see the consistent increase in the percentage of number of customers and percentage of total revenue from sales over the last 6 weeks since product launch, unlike the other methods, thus Email + Call method being the largest contributor as at last week. Also, we can see that Email + Call method is the biggest contributor to the high - value sales. Additionally, considering time invested for each method, Email + Call approach provides the best return on effort, with email requiring little work from the team and the call being around ten minutes per customer. The team should focus more on it.

•	Continue focusing on recent customers as they have the highest customer engagement.

•	Data Collection for in-depth analysis: Why has there been a significant and consistent decrease in Email sales method performance despite its initial high performance?

<b>Presentation of the findings</b>

https://github.com/gladysnjeri/PortfolioProjects/assets/72007182/0f6bc0f0-6a5b-43d6-a9c2-929026a7a4d7



