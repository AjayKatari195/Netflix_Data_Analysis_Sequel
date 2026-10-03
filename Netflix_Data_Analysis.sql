--Netflix Project

Create Table Netflix
(
  show_id    VARCHAR(6),
  type       VARCHAR(10),
  title      VARCHAR(150), 
  director   VARCHAR(208),
  castS          VARCHAR(1000),
  country        VARCHAR(150),
  date_added     VARCHAR(50), 
  release_year   INT,
  rating         VARCHAR(10),
  duration       VARCHAR(15),
  listed_in      VARCHAR(100), 
  description    VARCHAR(250)
);

Select *
From Netflix

--Business Problems

--> Count the number of Movies vs Tv shows

     Select type, count(*) as total_content
	 From Netflix
	 Group by Type

--> Find the most common rating for movies and tv shows

	 Select type, rating
	 From 
	(
	 Select Type, rating, count(*),
	 Rank() over(Partition By Type Order By count(*) Desc) as ranking
	 From Netflix
	 Group By 1,2
	) as t1
	Where ranking =1

--> List all movies released in a specific year (e.g, 2020)	

	 Select title
	 From Netflix
	 Where type='Movie' And release_year='2020'

--> find the top 5 countries with the most content on netflix

	  Select  UNNEST(String_to_array(country, ',')) AS new_country, count(show_id) as total_content
	  From Netflix
	  Group By 1
	  Order By 2 Desc
	  limit 5;

--> Identify the longest Movie!!

    Select *
	From Netflix
	Where type='Movie' AND duration=(Select MAX(duration) From Netflix)

--> Find content added in the last 5years 	

	Select *
	From Netflix
	Where to_date(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 YEARS';
	  
 --> Find all the movies/TV shows by director 'Rajiv chilaka' !  
	 
	 Select *
	 From Netflix
	 Where director LIKE '%Rajiv Chilaka%'

--> List all Tv shows with more than 5 seasons	 

	Select *
	From Netflix
	Where type='TV Show' and split_part(duration, ' ' ,1)::numeric > 5
	
--> Count the number of content items in each genre

	  Select UNNEST(string_to_array(listed_in, ',')) , count(show_id) as total_content
	  From Netflix
	  Group By 1

--> Find each year and the average numbers of content release by india on netflix.   
	 -- return top 5 year with highest avg content release.

	 Select Extract(Year from To_date(date_added, 'Month DD, YYYY')) as year, count(*),
	 Round(count(*)::numeric/(select count(*) From Netflix Where country='India')::numeric * 100,2) as avg_content_per_year
	 From Netflix
	 Where country ='India'
	 Group By 1

--> List all the movies that are documentaries	 

	  Select *
	  From Netflix
	  Where listed_in Ilike '%Documentaries%'
	 
 --> Find all content without a director   

     Select *
	 From Netflix
	 Where director is null
    
--> Find how many movies actor 'salman khan' appeared in last 10 years!

	 Select *
	 From Netflix
	 Where casts ILIKE '%Salman khan%' and release_year> extract(year from current_date)-10

--> Find the top 10 actors who have appeared in the highest number of movies produced in india

     Select Unnest(string_to_array(casts, ',')) as actors, count(*) as total_content
	 From Netflix
	 Where country ilike '%india%'
	 Group By 1
	 order by 2 desc 
	 limit 10

--> Categorize the content based on the presence of keywords 'kill'	and 'violence' in the description field
   -- label content containing these keywords as 'bad' and all other content as 'good'. count how many items
   --fall into category.
	 With tab
	 As
	 (
	 Select *,
	         Case
			 When
			    description ilike '%kill%' or
				description ilike '%violence%' then 'bad_content'
				else 'good content'
				end category
				from netflix
	 )
	 Select category, count(*) as total_content
	 From tab
	 Group By 1

























