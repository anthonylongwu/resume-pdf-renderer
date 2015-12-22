class StudentsController < ApplicationController
require "prawn"


  def index
  @students = Student.all

  end

  def show
    @student = Unirest.get("http://localhost:3000/students/#{params[:id]}.json").body
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        # pdf = Student.new(@student)
        # p Student.new(@student)
        pdf.text @student["first_name"] + " " + @student["last_name"]
        pdf.text "Email: " + @student["email"]
        pdf.text "Phone Number: " + @student["phone"]
        pdf.text "Short Bio: " + @student["bio"]
        pdf.text "LinkedIn URL: " + @student["linked_in"]
        pdf.text "Blog: " + @student["blog"]
        # @student["experience"].each do |experience|
        #   pdf.text experience
        # end

        # pdf.text "LinkedIn: " + @student["linkedin_url"]
        # pdf.text "Twitter URL: " + @student["twitter_url"]
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end
end