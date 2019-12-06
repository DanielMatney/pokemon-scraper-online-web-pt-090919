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
    sql = <<-SQL
       INSERT INTO pokemon (name, type, db)
       VALUES (?, ?)
      SQL
    DB[:conn].execute(sql, name, type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  
  
  
  
  
  
  
  
  
  
  
end