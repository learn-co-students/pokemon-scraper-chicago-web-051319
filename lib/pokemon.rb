
class Pokemon
    attr_accessor :id, :name, :type, :db
    
    @@all = []

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.save(name, type, db) #"Pikachu", "electric", @db
        
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.all
        @@all
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", id)[0]
        poke_id = pokemon[0]
        poke_name = pokemon[1]
        poke_type = pokemon[2]
        # Pokemon.new(*pokemon, db)
        Pokemon.new(id: poke_id, name: poke_name, type: poke_type, db: db)
    end
end

