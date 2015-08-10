class Email
  attr_accessor :name, :company

  def initialize(name, company)
    @name = name
    @company = company
  end

  def first_name_dot_last_name
    email = @name.downcase.gsub(" ", ".") + "@" + @company
    email
  end

  def first_name_dot_last_initial
    email = @name.downcase.split
    email[0] + "." + email[1][0] + "@" + @company  
  end

  def first_initial_dot_last_name
    email = @name.downcase.split
    email[0][0] + "." + email[1] + "@" + @company
  end

  def first_initial_dot_last_initial
    email = @name.downcase.split
    email[0][0] + "." + email[1][0] + "@" + @company
  end

  def predict
    if @company.include?("alphasights")
      first_name_dot_last_name
    elsif @company.include?("google")
      first_name_dot_last_initial + " or " + first_initial_dot_last_name
    elsif @company.include?("apple")
      first_initial_dot_last_initial
    else
      "Sorry, no email matches for #{@name}."
    end
  end


end