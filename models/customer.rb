    require_relative('../db/sql_runner.rb')


    class Customer

      attr_reader :id, :name, :address, :phone_number

      def initialize(options)
        @id = options["id"].to_i()
        @name = options["name"]
        @address = options["address"]
        @phone_number = options["phone_number"]
      end

      def save()
        sql = "INSERT INTO customers (name, address, phone_number) VALUES ($1, $2, $3) RETURNING id"
        values = [@name, @address, @phone_number]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i()
      end

      def self.delete_all
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
      end

      def self.all
        sql = "SELECT * FROM customers"
        customers = SqlRunner.run(sql)
        result = customers.map{|customer| Customer.new(customer)}
        return result
      end

      def self.delete(id)
        sql = "DELETE FROM customers
        WHERE id = $1"
        values = [id]
        SqlRunner.run( sql, values )
      end

      def self.find(id)
        sql = "SELECT * FROM customers WHERE id = $1"
        values = [id]
        customer = SqlRunner.run(sql, values)
        result = Customer.new(customer.first)
        return result
      end

      def update()
        sql = "UPDATE customers
        SET
        (
          name, address, phone_number
        ) =
        (
          $1, $2, $3
        )
        WHERE id = $4"
        values = [@name, @address, @phone_number, @id]
        SqlRunner.run( sql, values )
      end

      def animals()
        sql = "SELECT * FROM animals WHERE animals.owner_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |animal| Animal.new(animal) }
      end

    end
