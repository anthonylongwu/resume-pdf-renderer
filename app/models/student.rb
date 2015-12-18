require "prawn"

class Student

  def self.pdf
    Prawn::Document.generate("hello.pdf") do 
     text "Hello World!" 
   end 
 end

end