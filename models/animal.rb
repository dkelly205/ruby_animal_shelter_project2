require_relative('../db/sql_runner.rb')


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

  def self.delete(id)
     sql = "DELETE FROM albums
     WHERE id = $1"
     values = [id]
     SqlRunner.run( sql, values )
   end

  def self.all
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map{|animal| Animal.new(animal)}
    return result
  end

  def self.find(id)
        sql = "SELECT * FROM animals WHERE id = $1"
        values = [id]
        animal = SqlRunner.run(sql, values)
        result = Animal.new(animal.first)
        return result
  end

  def delete()
   sql = "DELETE FROM animals
   WHERE id = $1"
   values = [@id]
   SqlRunner.run( sql, values )
 end


  def update()
    sql = "UPDATE animals
    SET
    (
      name, type, breed, admission_date, adoptable, image, owner_id
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@name, @type, @breed, @admission_date, @adoptable, @image, @owner_id]
    SqlRunner.run( sql, values )
  end





end
