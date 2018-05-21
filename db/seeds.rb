require_relative('../models/animal.rb')
require_relative('../models/customer.rb')

Customer.delete_all
Animal.delete_all

  customer1 = Customer.new({
   'name' => 'John Smith',
   'address' => '10 Crow Road, Glasgow, G10 6PP',
   'phone_number' => '01411111111'
   })

 customer1.save

 animal1 = Animal.new({
   'name' => 'Alfie',
   'type' => 'dog',
   'breed' => 'shitzu',
   'admission_date' => '08-Jan-2018',
   'adoptable' => true,
   'image' => 'shitzu.jpeg',
   'owner_id' => customer1.id
   })

   animal1.save

   animal2 = Animal.new({
     'name' => 'Whizz',
     'type' => 'dog',
     'breed' => 'whippet',
     'admission_date' => '08-Jan-2018',
     'adoptable' => true,
     'image' => 'whippet.jpeg',
     'owner_id' => customer1.id
     })

  animal2.save

  animal3 = Animal.new({
    'name' => 'Rocky',
    'type' => 'dog',
    'breed' => 'rottweiller',
    'admission_date' => '08-Jan-2018',
    'adoptable' => true,
    'image' => 'rottweiler.jpeg',
    'owner_id' => customer1.id
    })

    animal3.save
