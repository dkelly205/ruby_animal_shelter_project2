class Customer

  attr_reader :id, :name, :address, :phone_number

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @address = options["address"]
    @phone_number = options["phone_number"]
  end
end
