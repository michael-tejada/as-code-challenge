class Person
  attr_accessor :name, :company_site, :email

  EMAILS = {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com"
    }

  def initialize(first_name, last_name, company_site, email=nil)
    @name = (first_name.downcase + " " + last_name.downcase).split(" ")
    @company_site = company_site.downcase
    @email = email
  end

  def parse_persons
    EMAILS.select do |k,v|
      v.include?(@company_site)
    end
  end

  def split_email(email)
    email[/[^@]+/].downcase.split('.')
  end

  def email_pattern(person)
  @first_name, @last_name = person.first.downcase.split(" ")
  @before_dot, @after_dot = split_email(person.last)
    if @first_name == @before_dot && @last_name == @after_dot
      first_name_dot_last_name
    elsif @first_name == @before_dot && @last_name[0] == @after_dot
      first_name_dot_last_initial
    elsif @first_name[0] == @before_dot && @last_name == @after_dot
      first_initial_dot_last_name
    elsif @first_name[0] == @before_dot && @last_name[0] == @after_dot
      first_initial_dot_last_initial
    else 
        
    end 
  end 

  def first_name_dot_last_name
    "#{@name[0]}.#{@name[1]}@#{@company_site}"
  end 

  def first_name_dot_last_initial
    "#{@name[0]}.#{@name[1][0]}@#{@company_site}"
  end 

  def first_initial_dot_last_name
    "#{@name[0][0]}.#{@name[1]}@#{@company_site}"
  end 

  def first_initial_dot_last_initial  
    "#{@name[0][0]}.#{@name[1][0]}@#{@company_site}"
  end 


  def find_email
    parse_persons.collect do |person|
      email_pattern(person)
    end.compact.uniq
  end

  def add_to_hash
    name = @name.join(" ")
    name = name.split.map(&:capitalize).join(' ')
    EMAILS.store("#{name}", "#{@email.downcase}")
  end


end

