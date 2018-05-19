require_relative('../models/animal.rb')
require_relative('../models/customer.rb')

Customer.delete_all
Animal.delete_all

animal1 = Animal.new({
  'name' => 'Alfie',
  'type' => 'dog',
  'breed' => 'shitzu',
  'admission_date' => '08-Jan-2018',
  'adoptable' => true,
  'image' => 'n/a',
  })

  animal1.save

  customer1 = Customer.new({
   'name' => 'John Smith',
   'address' => '10 Crow Road, Glasgow, G10 6PP',
   'phone_number' => '01411111111'
   })

 customer1.save
