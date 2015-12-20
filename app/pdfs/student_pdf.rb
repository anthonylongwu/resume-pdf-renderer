class StudentPdf 
  include Prawn::View

  def initialize
    super
    text "Student!"
  end
end