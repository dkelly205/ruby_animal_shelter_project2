require( 'minitest/autorun' )
require_relative '../models/animal.rb'
require_relative '../models/customer.rb'

class TestAnimal < Minitest::Test

  def setup

    @customer = Customer.new({
      'id' => 1,
      'name' => 'Bruce Wayne',
      'address' => '123 Gotham Street, Glasgow, G64 2QR',
      'phone_number' => '07774045677'
      })

     @animal = Animal.new({
       'name' => 'Alfie',
       'type' => 'Dog',
       'breed' => 'Shitzu',
       'admission_date' => '18/05/2018',
       'adoptable' => true,
       'image' => 'shitzu.jpeg',
       'owner_id' => @customer.id
       })
   end

   def test_animal_name
     assert_equal( "Alfie", @animal.name() )
   end

   def test_animal_type
     assert_equal("Dog", @animal.type())
   end

   def test_aniaml_breed
     assert_equal("Shitzu", @animal.breed())
   end

   def test_animal_admission_date
     assert_equal("18/05/2018", @animal.admission_date())
   end

   def test_animal_adoptable
     assert_equal(true, @animal.adoptable())
   end

   def test_animal_image
     assert_equal("shitzu.jpeg", @animal.image())
   end

   def test_animal_has_owner
     assert_equal(1, @animal.owner_id)
   end

   def test_animal_can_change_status
     @animal.change_status()
     assert_equal(false, @animal.adoptable)
   end


 end
