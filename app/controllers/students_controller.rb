class StudentsController < ApplicationController

  # include Prawn::Viewer

  def index
    # @students = Unirest.get("url").body
    respond_to do |format|
      format.html
      format.pdf { render :layout => false}
    end
  end

  def show
    # @student = Unirest.get("url/id").body


  end
end

