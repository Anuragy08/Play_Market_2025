#-- Top 10 games with highest rating and more than 10,000 downloads.
select game_id, game_name, downloads, max(score) as "Highest_rating" from games_info
where downloads > 10000
group by 1,2,3
order by 4 desc
limit 10;

#-- Game section with average score and number of games (Clustered bar chart: category vs Average Score and Total Games  /  
#-- Treemap: Size by total_games, color by avg_score)
select section, count(game_name) as "Number of games", avg(score) as "Average_Score" from games_info
group by 1
order by 2 desc;
 
#-- Monthly treand of game reviews (Line chart - To show distribution over time)
select date_format(review_date, '%y-%m') as "Month_Name", avg(review_score) as "Average_Review_Score" from games_reviews
where monthname(review_date) is not null
group by 1
order by 1;