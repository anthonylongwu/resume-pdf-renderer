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
        pdf.text @student["first_name"] + " " + @student["last_name"]
        pdf.text "Email: " + @student["email"]
        pdf.text "Phone Number: " + @student["phone"]
        pdf.text "Short Bio: " + @student["bio"]
        pdf.text "LinkedIn URL: " + @student["linked_in"]
        pdf.text "Blog: " + @student["blog"]

        pdf.text "Experience:"
        pdf.text "Start Date: " + @student["experience"].first["start_date"]
        pdf.text "End Date: " + @student["experience"].first["end_date"]
        pdf.text "Title: " + @student["experience"].first["title"]
        pdf.text "Company: " + @student["experience"].first["company"]

        pdf.text "Skills: " + @student["skills"].first["name"]
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end
end