#Query 1
# Who prefers energy drink more? (male/female/non-binary)
with cte as(select age,
case when gender="Male" then 1 else 0 end as total_male,
case when gender="Female" then 1 else 0 end as total_Female,
case when gender="Non-binary" then 1 else 0 end as total_NonBinary
from dim_repondents
)
select sum(total_male),sum(total_Female),sum(total_NonBinary)
from cte;

# Query 2
#Which age group prefers energy drinks more?
select age,count(*) as Age_preferenc from dim_repondents
group by age
order by  Age_preferenc desc
limit 1;

# Query 3
#What are the preferred ingredients of energy drinks among respondents?
select Ingredients_expected as Ingredients, count(*) as Total_ingredients_preferred
from fact_survey_responses
group by Ingredients_expected
order by Total_ingredients_preferred desc;

# Query 4
#What are the preferred packaging references?
select Packaging_preference as Packagings, count(*) as Total_preferred_package
from fact_survey_responses
group by Packaging_preference
Order by Total_preferred_package desc;

# Query 5
# Who are the current market leaders?
select current_brands, count(*) as Total from fact_survey_responses
group by Current_brands
order by 2 desc;

#Query 6
# What are the primary reasons consumers prefer those brands over ours?
select Reasons_for_choosing_brands as brands,Count(*) as Reasons_prefer_brands
from fact_survey_responses
group by Reasons_for_choosing_brands
Order by Reasons_prefer_brands DESC;

#Query 7
#Which marketing channel can be used to reach more customers?
select marketing_channels,count(*) as total
from fact_survey_responses
group by 1
order by 2 desc;

#Query 8
#What do people think about our brand? (overall rating)
select Brand_perception, count(*) as Brand_rating
from fact_survey_responses
group by Brand_perception
order by Brand_rating desc;

select Taste_experience, count(*) as Taste_rating
from fact_survey_responses
group by Taste_experience
order by Taste_rating desc;

#Query 9
#Which cities do we need to focus more on?
select c.city,count(*) as tier from dim_cities c
join dim_repondents r 
on c.city_id=r.City_ID
group by c.city_id,tier
order by tier ;

 #Query 10
# Which type of marketing reaches the most Youth (19-30)?

select count(*) as total,f.Marketing_channels  from dim_repondents r
join fact_survey_responses f
on r.Respondent_ID=f.Respondent_ID 
where r.age='19-30'
group by f.Marketing_channels
order by total desc;
 
 #Query 11
#Where do respondents prefer to purchase energy drinks?

select purchase_location,count(*) as prefer_purchase_location from fact_survey_responses
group by Purchase_location
order by prefer_purchase_location desc;


#Query 12
#What are the typical consumption situations for energy drinks among respondents?

 select typical_consumption_situations,count(*) as total from fact_survey_responses
 group by Typical_consumption_situations
 order by total desc;
 
 #Query 13
 #What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
 
 
select Price_range,count(*) as desired_price from fact_survey_responses
group by Price_range
order by desired_price desc;

select Limited_edition_packaging, count(*) as Survey_answer
from fact_survey_responses
group by Limited_edition_packaging
order by Survey_answer desc;


#Query 14
#Which area of business should we focus more on our product development? (Branding/taste/availability)

select Reasons_for_choosing_brands,count(*) from fact_survey_responses
group by Reasons_for_choosing_brands
order by 2 desc;

#Query 15 (Secondary Questions)
# best consuption time?

select Consume_time,count(*) from fact_survey_responses
group by consume_time
order by 2 desc;

#Query 16
#Major cosume reason?
select Consume_reason as benefits, count(*) as total
from fact_survey_responses
group by Consume_reason
order by total desc;

#Query 17
#Reason from preventing our brand
select Reasons_preventing_trying, count(*) as total
from fact_survey_responses
group by Reasons_preventing_trying
order by total desc;


#Query 18
# Improvment desired in our brand
select Improvements_desired, count(*) as total
from fact_survey_responses
group by Improvements_desired
order by total desc;


#Query 19
# people intrest in organic?
select Interest_in_natural_or_organic, count(*) as total
from fact_survey_responses
group by Interest_in_natural_or_organic
order by total desc;


#Query 20
# people heard before
select Heard_before, count(*) as total
from fact_survey_responses
group by Heard_before
order by total desc;


#Query 22
# Tried_before
select Tried_before, count(*) as total
from fact_survey_responses
group by Tried_before
order by total desc;








