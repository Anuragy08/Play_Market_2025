#-- Top 10 apps by total downloads (Bar/Column chart : app_name Vs downloads)
select app_id, app_name, categories, downloads from apps_info
group by 1,2
order by 4 desc
limit 10;

#-- Average Score & number of reviews per category (Combo chart: bar for review count + line for avg score)
select t1.categories, count(t2.review_text) as "Total Reviews", avg(t2.review_score) as "Average Review Score" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1
order by 2 desc;

#-- Monthly trend of app reviews (Line chart - To show distribution over time)
select date_format(review_date, '%y-%m') as "Month_Name", avg(review_score) as "Average_Review_Score" from apps_reviews
where monthname(review_date) is not null
group by 1
order by 1;

#-- Top 5 most helpful app reviews  (summary table with conditional formatting on Total helpful app reviews)
select t1.app_id, t1.app_name, count(t2.review_score) as "Number of Review Scores", sum(t2.helpful_count) as "Total helpful app reviews" from apps_info t1
join apps_reviews t2 on t1.app_id = t2.app_id
group by 1,2
order by 4 desc
limit 5;

