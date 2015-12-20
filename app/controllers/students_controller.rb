class StudentsController < ApplicationController
require "prawn"


  def index
    # @students = Student.all

  end

  def show
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        # pdf = Prawn::Document.new
        pdf = Student.new(@student)
        # pdf.text "Hello World"
        send_data pdf.render, filename: "student_#{student.id}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end
end