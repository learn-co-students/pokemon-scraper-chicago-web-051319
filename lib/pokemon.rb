require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  # def initialize(props={})
  #   @name = name
  #   @type = type
  #   @db = db
  #   @id = id
  #   @@all << self
  # end


  def self.save(name, type, db)

    db.execute('INSERT INTO pokemon(name, type)
                  VALUES(?, ?);', name, type)
  end

  def self.find(id, db)
      new_pokemon = db.execute('SELECT * FROM pokemon WHERE id = ?;', id)[0]
# binding.pry
      new_id = new_pokemon[0]
      new_name = new_pokemon[1]
      new_type = new_pokemon[2]
      Pokemon.new(name: new_name, type: new_type, id: new_id, db: db)
   end


end
