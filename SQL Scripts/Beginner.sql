#-- List all app names along with their score
select app_name, score from apps_info;

#-- Count the total number of apps and games
select count(app_id) from apps_info;
select count(game_id) from games_info; 

#-- Show all apps thaat belong to a specfic category.
select categories, count(app_id) from apps_info
group by 1;

select app_id, app_name, categories from apps_info
where categories like 'en%';

#-- Display the average score of all apps
select app_name, avg(score) as 'average_score' from apps_info
group by 1;

#-- List all games with a content rating of 'Everyone'
select game_id, game_name, content_rating from games_info
where content_rating like 'every%e'