require( 'minitest/autorun' )
require_relative '../models/customer.rb'

class TestCustomer < Minitest::Test

  def setup
     @customer = Customer.new({
       'id' => 1,
       'name' => 'Bruce Wayne',
       'address' => '123 Gotham Street, Glasgow, G64 2QR',
       'phone_number' => '07774045677'
       })
   end

   def test_customer_name
     assert_equal( "Bruce Wayne", @customer.name() )
   end

   def test_customer_id
     assert_equal( 1, @customer.id() )
   end

   def test_customer_address
     assert_equal("123 Gotham Street, Glasgow, G64 2QR", @customer.address)
   end

   def test_customer_phone_number
     assert_equal("07774045677", @customer.phone_number)
   end
 end
