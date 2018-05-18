class Animal

  attr_reader :id, :name, :type, :breed, :admission_date, :adoptable, :image

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @type = options["type"]
    @breed = options["breed"]
    @admission_date = options["admission_date"]
    @adoptable = options["adoptable"]
    @image = options["image"]
  end
end
