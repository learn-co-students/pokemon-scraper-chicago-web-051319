class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db =  db
        @hp = hp
        @@all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
            db.execute("INSERT INTO pokemon (name, type) 
                        VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        new_poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", id)[0]
        poke_id = new_poke[0]
        poke_name = new_poke[1]
        poke_type = new_poke[2]
        poke_hp = new_poke[3]
        Pokemon.new(id: poke_id, name: poke_name, type: poke_type, db: db, hp: poke_hp)
    end
   
    def alter_hp(new_hp,db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
    end
end
