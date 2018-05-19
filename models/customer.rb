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
   sql = "DELETE * FROM customers"
   SqlRunner.run(sql)
 end
end
