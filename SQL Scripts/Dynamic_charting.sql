#-- Filter by category: Show App Performance
#-- [Create a drop-down to choose categories. The chart(e.g. bar chart of downloads per app) updates accordingly]
select categories, app_name, sum(downloads) as "Total_downloads", Avg(score) as "Average_Score" from apps_info
group by 1,2;

#-- Compare App Review Scores by Section
#-- [Drop down to filter by section. Display a line or column chart of app names vs scores]
select t1.section, t1.app_name, AVG(t2.review_score) as "avg_score" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2;

#-- Review Trend Over Timw by App
#-- [Drop-Down to select app_name, Line chart updates to show monthly review volume]
select t2.app_id, t2.app_name, DATE_FORMAT(review_date, '%y-%m'), count(*) as "Total_Review" from apps_reviews t1
join apps_info t2 on t1.app_id = t2.app_id
group by 1,2,3
order by 4; 

#-- Select a Game Section and Compare Downloads
#-- [Drop-down with section values. Plot top games by downloads using a bar chart]
select section, game_name, downloads from games_info;

#-- Helpful Review Analysis per App/Game
#-- [Drop-down of app names. Gauge chart shows average helpfulness of reviews]
select t1.app_name, avg(t2.helpful_count) as "Average_helpful_count" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1
order by 2 desc;

select t1.game_name, avg(t2.helpful_count) as "Average_helpful_count" from games_info t1
join games_reviews t2 on t1.app_id = t2.app_id
group by 1
order by 2 desc;

#-- Download Vs Score Scatter Plot for selected category
#-- [Drop-Down with categories. Scatter plot shows relationship between downloads and score]
select categories, app_name, downloads, score from apps_info;

#-- Top 5 reviewed apps for a given month
#-- [Drop-down for month. Bar chart updates automatically]
select month(review_date) as Month, t2.app_name, count(*) as total_reviews from apps_reviews t1
join apps_info t2 on t1.app_id = t2.app_id
group by 1,2; 
