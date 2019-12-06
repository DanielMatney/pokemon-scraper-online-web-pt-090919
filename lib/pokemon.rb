require_relative "../bin/environment.rb"
class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
    pokemon = Pokemon.new(pokemon[0], pokemon[1], pokemon[2], pokemon[3])
  end
end