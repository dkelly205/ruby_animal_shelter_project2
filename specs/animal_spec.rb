require( 'minitest/autorun' )
require_relative '../models/animal.rb'

class TestAnimal < Minitest::Test

  def setup
     @animal = Animal.new({
       'name' => 'Alfie',
       'type' => 'Dog',
       'breed' => 'Shitzu',
       'admission_date' => '18/05/2018',
       'adoptable' => true,
       'image' => 'shitzu.jpeg'
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


 end
