class StudentsController < ApplicationController
require "prawn"


  def index
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello World"
        send_data pdf.render
      end
    end

  end

  def show
    # @student = Unirest.get("url/id").body
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