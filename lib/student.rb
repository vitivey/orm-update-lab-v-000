require_relative "../config/environment.rb"

class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    self.name = name
    self.grade =  grade
  end

  def self.create_table
    DB[:conn].execute()
  end





  
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
