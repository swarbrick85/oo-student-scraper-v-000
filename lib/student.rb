class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name] 
    @location = student_hash[:location]
    @profile_url = student_hash[:profile_url]
    @@all << self 
  end

  def self.create_from_collection(students_array)
    students_array.each do |hash|
      x = Student.new(hash)
    end 
  end

  def add_student_attributes(attributes_hash)
    x = @@all.find {|student| student.name == attributes_hash.name} 
    x[:bio] = attributes_hash[:bio]
    x[:profile_quote] = attributes_hash[:profile_quote]
    x[:twitter] = attributes_hash[:twitter]
    x[:linkedin] = attributes_hash[:linkedin]
    x[:github] = attributes_hash[:github]
    x[:blog] = attributes_hash[:blog]
  end

  def self.all
    @@all 
  end
end

