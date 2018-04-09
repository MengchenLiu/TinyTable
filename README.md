# MPCS 52553 - Final Project

**Brief Summary**

This is a web-based application for reserve restaurants.

User can login/logout, make/cancel reservations, write/edit reviews, see their upcoming/past reservations, 
view/edit profile and earn points.

The project also has administrative functions,
Administrators can add/edit/delete restaurants, view all reservations in index page of reservations,
view reservations per restaurant in show page of restaurants and view business statistics.

For feature elective, I use Twilio to send reservation confirmation text to users, and use google chart API for statistics page.


**List of Instructions and Simplifying Assumptions/Restrictions**

* use $`rails db:migrate` to generate model
* use $`rails db:seed` to generate some data
* Datetime format 2017-6-10 17:00:00
* If something wrong will sessions or cookies , please clear cookies and refresh
* use below user to test administrator function
```
User name:admin
password:000000
```
* use below user to test customer function
```
User name:Yun
password:000000
```



**Function HighLight(list of user stories completed)**

* After sign up will automatically sign in
* Only give review entry in past reservation to ensure user can only review a restaurant after a reservation
* If user write review to this restaurant before, there will show a Edit Review button instead of Write Review, 
maintain one user only have one review to a given restaurant
* Visitors can see a list of restaurants and show page of detail, 
after sign in a "Book Restaurant" button will appear at top right corner of `restaurant#show`
* Login user can make a reservation by click it and input the time of your reservation
* User can view his/her own profile page, it will show upcoming and past reservation.
* User can cancel an upcoming reservation
* User can write/edit review for past reservation
* Administrator can access reservation page
* When login as administrator, "add a restaurant", "toast" and "edit" button will appear on restaurant index page
* On detail page of restaurant, beside the review, administrator can also see the reservation of this restaurant
* Administrator can access statistics page show business statistics
* Visitors can sign up as a new user
* Has validation and show warning for wrong input 


**Implemented Validations**

* Has validation for reservation time must in future(in `/app/model/reservation.rb`),
comment out for test convenience(to add past reservation for testing review function) 
* User: name,password,email presence, password length in 6-20, email format
* Restaurant: table_num is integer between 1-10
* Review: score is integer between 0-5, user can only have one review for a given restaurant,
if write a review before, can edit later.
* Reservation: restaurant_id,user_id, time presence, reservation time between 11am - 10pm, can check time format, 
if all tables are booked out at given time, can't make reservation any more.



**Feature Elective**
* Implement confirmation text by Twilio, since trial account,all text will sent to my own phone, you can see this in action `reservations#create` 
* Show statistics with google chart API




