class Student

  attr_accessor :first_name, :last_name, :email, :phone, :short_bio, :linkedin_url, :twitter_url, :blog_url, :id

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @phone = hash["phone"]
    @short_bio = hash["short_bio"]
    @linkedin_url = hash["linkedin_url"]
    @twitter_url = hash["twitter_url"]
    @blog_url = hash["blog_url"]
    @id = hash["id"]
  end

  def self.all
    students = []
    students_hash = Unirest.get("http://localhost:3000/students.json").body
    p students_hash
    students_hash.each do |student|
      student << Student.new(student)
    end
    return students
  end

  def self.find(id)
    student_hash = Unirest.get("http://localhost:3000/students/#{id}.json").body
    @student = Student.new(student_hash)
    return @student
  end

end