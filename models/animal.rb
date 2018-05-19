class Animal

  attr_reader :id, :name, :type, :breed, :admission_date, :adoptable, :image, :owner_id

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @admission_date = options["admission_date"]
    @adoptable = options["adoptable"]
    @image = options["image"]
    @owner_id = options["owner_id"]
  end

  def change_status()
    @adoptable = !@adoptable
  end

  def save()
  sql = "INSERT INTO animals (name, type, breed, admission_date, adoptable, image, owner_id) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *"
  values = [@name, @type, @breed, @admission_date, @adoptable, @image, @owner_id]
  @id = SqlRunner.run(sql, values)[0]["id"].to_i()
end

def self.delete_all
  sql = "DELETE FROM animals"
  SqlRunner.run(sql)
end





end
