# ruby_animal_shelter_project2

Project Brief

Animal Shelter
The Scottish Animal Shelter accepts orphaned or stray animals and takes care of them until they can be adopted by a new owner. The shelter has a list of potential new owners for the animals. Animals may take a while to be trained up and made healthy before being available for adoption.

They are looking for a management system to keep track of their animals and owners.

MVP:
A list of all their animals and their admission date
Mark an animal as being adoptable/not adoptable
Assign an animal to a new owner
List all the owners and their adopted animals
Possible Extensions:
CRUD actions for animals/owners
Have separate pages for animals ready for adoption and ones still in training/vet care
Search for animals by breed/type

Project Rules
You are required to submit your link to github as soon as it has been created. We will be doing a code review at 12 noon on Wednesday.

Presentations will be held on Thursday.

The project must be built using only:

Sinatra
PostGRES SQL
HTML / CSS
Ruby
It must NOT use:

Any Object Relational Mapper (e.g. ActiveRecord)
JavaScript. At all. Don't even think about it
Authentication




To run the app:

Clone the app

In terminal create the database using the following command:

                          createdb animal_shelter
                          
In terminal run the following command to create tables:

                         psql -d animal_shelter -f db/animal_shelter.sql

Run the app from folder animal_shelter in terminal using the following command:

                          ruby app.rb
                          
View the app at http://localhost:4567/

![image](https://user-images.githubusercontent.com/34646693/40627417-d39804aa-62b6-11e8-8488-3339722b73e6.png)


![image](https://user-images.githubusercontent.com/34646693/40627460-0b7ebd78-62b7-11e8-9e63-eb1a00627129.png)

![image](https://user-images.githubusercontent.com/34646693/40627470-1e582d12-62b7-11e8-80f5-6bb765695a7b.png)


![image](https://user-images.githubusercontent.com/34646693/40627467-1651cad8-62b7-11e8-98d4-25f12920e3db.png)

![image](https://user-images.githubusercontent.com/34646693/40627480-273eb73e-62b7-11e8-9c67-6ff51a87f08c.png)
