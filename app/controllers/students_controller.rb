class StudentsController < ApplicationController
require "prawn"


  def index
    # @students = Unirest.get("url").body
    @test = Student.pdf
  end

  def show
    # @student = Unirest.get("url/id").body
    # respond_to do |format|
    #   format.html
    #   format.pdf {render layout: false}
    # end
  end
end


# def show
#     @invoice = Invoice.find(params[:id])
#     respond_to do |format|
#       format.html
#       format.pdf do
#         pdf = InvoicePdf.new(@invoice, view_context)
#         send_data pdf.render, filename: 
#         "invoice_#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
#         type: "application/pdf"
#       end
#     end
#   end
# end