#-- Show the average review score for each app by joining app info and app reviews.
select t1.app_id, t1.app_name, avg(t2.review_score) as 'Average_Review_score' from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2; 

#-- List three most reviewed games.
select t1.game_id, t1.game_name, count(t2.review_score) as 'Number_of_reviews'from games_info t1
join games_reviews t2 on t1.game_id = t2.game_id
group by 1,2
limit 3; 

#-- Identify the month & year with the highest number of app reviews.
select concat(month(review_date),"-",year(review_date)) as 'Month & Year', count(review_score) as 'count_of_reviews'from apps_reviews
group by 1
order by 2 desc
limit 1;

#-- Create a report of total downloads and average review score for each game.
select t1.game_id, t1.game_name, count(t1.downloads) as 'Total_Downloads', avg(t2.review_score) as "Average_review_score" 
from games_info t1
join games_reviews t2 on t1.game_id = t2.game_id
group by 1,2;

#-- Compare the average review scores between apps and games
select 'Apps' as 'Type', avg(review_score) as 'Apps_review_score (Avg)' from apps_reviews

union ALL

select 'Games' as 'Type',avg(review_score) as 'Games_review_score (Avg)' from games_reviews;