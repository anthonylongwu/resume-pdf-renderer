class Student

  attr_accessor :first_name, :last_name, :email, :phone, :short_bio, :linkedin_url, :twitter_url, :blog_url, :id

  def initialize(student)
    @first_name = student["first_name"]
    @last_name = student["last_name"]
    @email = student["email"]
    @phone = student["phone"]
    @short_bio = student["short_bio"]
    @linkedin_url = student["linkedin_url"]
    @twitter_url = student["twitter_url"]
    @blog_url = student["blog_url"]
    @id = student["id"]
  end

  def self.find(id)
    student_hash = Unirest.get("http://localhost:3000/students/#{id}.json").body
  end

end