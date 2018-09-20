require "pry"
require_relative "../config/environment.rb"

class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    self.name = name
    self.grade =  grade
  end

  def self.create_table
    sql=<<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students;")
  end

  def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO students (name, grade) VALUES (?,?);
      SQL

      DB[:conn].execute(sql, self.name, self.grade)
      @id=DB[:conn].execute("SELECT last_insert_rowid() FROM students;")[0][0]
    end
  end

  def self.create(name:, grade:)
    student=Student.new(name,grade)
  end

  def self.new_from_db(row)
    binding.pry
  end


  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
