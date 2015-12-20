require "prawn"

class Student < Prawn::Document

  def initialize(student)
    @student = student
  end

end