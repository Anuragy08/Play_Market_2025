#-- Create a view that shows app name, category, downloads and average review score
create view summary as
select t1.app_name, t1.categories, t1.downloads, avg(t2.review_score) as 'Average_Score_review'from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2,3;

#-- Find the top 3 apps by average review score in each category.
select t1.app_name, t1.categories, t1.downloads, avg(t2.review_score) as 'Average_Score_review'from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2,3
order by 4 desc
limit 3;

#-- Identify apps or games with consistently low scores but high downloads counts.
select t1.app_id, t1.app_name, count(t1.downloads) as "Downloads_count", t2.review_score from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2
order by 3 desc, 4;

#-- Analyze which content rating category has the highest average review score.
select t1.content_rating, t1.categories, avg(t2.review_score) as 'Average_review_score' from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2
order by 3 desc; 

#-- Find the most helpful reviews across all apps and games.
select 'Apps' as type, t1.app_id, t1.app_name, count(t2.helpful_count) as 'Helpful_count' from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
UNION ALL
select 'Games' as type, t1.game_id, t1.game_name, count(t2.helpful_count) as 'Helpful_count' from games_info t1
join games_reviews t2 on t1.game_id = t2.game_id
group by 3
limit 10;