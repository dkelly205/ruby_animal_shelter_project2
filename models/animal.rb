require_relative('../db/sql_runner.rb')


class Animal

  attr_reader :id, :name, :type, :breed, :admission_date, :adoptable, :image, :owner_id, :incare

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @admission_date = options["admission_date"]
    @adoptable = options["adoptable"]
    @incare = options["incare"]
    @image = options["image"]
  end



  def self.availableToAdopt
    sql = "SELECT * FROM animals WHERE animals.adoptable = $1"
    values = [true]
    available_animals = SqlRunner.run(sql, values)
    result = available_animals.map{|available_animal| Animal.new(available_animal)}
    return result
  end

  def self.incare
    sql = "SELECT * FROM animals WHERE animals.incare = $1"
    values = [true]
    available_animals = SqlRunner.run(sql, values)
    result = available_animals.map{|available_animal| Animal.new(available_animal)}
    return result
  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, admission_date, adoptable, image, incare) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *"
    values = [@name, @type, @breed, @admission_date, @adoptable, @image, @incare]
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
      name, type, breed, admission_date, adoptable, image, incare
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@name, @type, @breed, @admission_date, @adoptable, @image, @incare, @id]
    SqlRunner.run( sql, values )
  end

  def self.search(breed)
    sql = "SELECT * FROM animals WHERE LOWER(breed) = $1"
    values = [breed.downcase]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal)  }
    return result
  end

  def change_status()
    @adoptable = !@adoptable
    update()
  end

end
