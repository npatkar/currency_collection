currency_collection
===================
Application Enhancements:

The basic application was meant for single user. A functionality for multiple user is added now. As multiple user can access the application there needs to be some sort of security  so that each user has access to his data only.
For the same the new feature of user registration and signin authentication using devise gem has been added. First user has to register himself and then he can signin using correct credentials and can access his data.
New model "Visit" for maintaining the user visits and collection data been intriduced now. Previously there was only one user so the "visits" column was in country table only.
A check box in currency and country table added to update the country, user has visited and currency he has collected. It also contains the 'check all' feature so as to check all the check box in single click.
After clicking on "Update Visits" button data gets updated, it is achieved by using ajax. It also updates the pie chart.
 

   
Test cases:

Cucumber + Capibara + devise been used for writing business cases to follow BDD. Four features been written in limited time signin, registration, contry, currency.
Had previous used the devise so could easily use user_steps for this project which helped to reduce time to developI developed this application as per BDD so it took bit longer than 6 hours to finish it. 
Still it took some more time and took 8 hours.

Installation/Deployment :

I have uploaded the code on github account => https://github.com/npatkar/currency_collection
1) clone the repository
2) use bundle install to install gems
$> bundle install
3) you may need to execute following if cucmber is not confiuredd 
$> rails generate cucumber:install --capybara --rspec
4) to test the features use
$> bundle exec cucumber features
5) to run server
$> rails s