#-- Apps with the highest average review score (from apps_reviews)
select t1.app_name, avg(t2.review_score) as "Average_Review_score" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1
order by 2 desc
limit 10;

#-- Total reviews and average helpful count per app/game (Bar Chart: App/Game vs Review Count,Bubble chart: Total Reviews Vs Avg Helpful Count) 
select "Apps" as "Type", t1.app_name, count(t2.review_score) as "Total Reviews", avg(t2.helpful_count) as "Average Helpful count" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 2
Union ALL
select "Games" as "Type", t1.game_name, count(t2.review_score) as "Total Reviews", avg(t2.helpful_count) as "Average Helpful count" from games_info t1
join games_reviews t2 on t1.game_id = t2.game_id
group by 2;

#-- Top apps and games by total review volume (Bar Chart: App/Game name vs total reviews)
select "App" as "Type", t1.app_name, count(t2.review_score) as "Total_Review_Volume" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2
order by 3 desc
limit 10;

select "Games" as "Type", t1.game_name, count(t2.review_score) as "Total_Review_Volume" from games_info t1
join games_reviews t2 on t1.game_id = t2.game_id
group by 1,2
order by 3 desc
limit 10;
