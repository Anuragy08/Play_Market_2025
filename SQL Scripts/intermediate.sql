#-- Find the top 5 highest-rated apps
select app_id, app_name, ratings_count from apps_info 
order by ratings_count desc
limit 5;

#-- List apps that have more than 10,000 downloads and a score above 4.5
select app_id, app_name, score, downloads from apps_info
where downloads > 10000 and score > 4.5; 

#-- Show the total number of reviews for each app
select t1.app_id, t1.app_name, count(t2.review_text) as 'Reviews_count' from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2;

#-- Identify the app with most helpful review  
select t1.app_id, t1.app_name, max(t2.helpful_count) as 'most_helpful_review' from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2
order by 3 desc;

#-- List all games released in a particular section.
select game_id, game_name, section from games_info
where section like 'a%';