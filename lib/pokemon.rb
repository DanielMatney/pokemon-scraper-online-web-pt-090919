require_relative "../bin/environment.rb"
class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.new_from_db(row)
    pokemon = self.new(row[0],row[1],row[2])
    pokemon.id = @id
    pokemon.name = @name
    pokemon.type = @type
    pokemon
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
    @id = db.execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
  
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
  end
end