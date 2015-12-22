class StudentPdf 
  include Prawn::View

  def initialize(student)
    super
    @student = student
    text "Student!"
  end
end