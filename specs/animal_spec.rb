require( 'minitest/autorun' )
require_relative '../models/animal.rb'

class TestAnimal < Minitest::Test

  def setup
     @animal = Animal.new({
       'name' => 'Alfie'
       })
   end

   def test_animal_name
     assert_equal( "Alfie", @animal.name() )
   end
 end
