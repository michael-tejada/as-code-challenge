require_relative './spec_helper.rb'
require './app/models/person.rb'

describe "Person" do 
  let(:client) {Person.new("Michael", "Tejada","flatironschool.com")}
  let(:client1) {Person.new("Peter", "Wong", "alphasights.com")}
  let(:client2) {Person.new("Craig", "Silverstein", "google.com")}
  let(:client3) {Person.new("Steve",  "Wozniak", "apple.com")}

  it "should have a name" do 
    client.name = "Michael Tejada"
    expect(client.name).to eq("Michael Tejada")
  end

  it "should have a company url" do
    client.company_site = "flatironschool.com"
    expect(client.company_site).to eq("flatironschool.com")
  end

  it "should return a formatted email with firstname.lastname" do
    expect(client.first_name_dot_last_name).to eq ("michael.tejada@flatironschool.com")
  end

  it "should return a formatted email with firstname.lastinitial" do
    expect(client.first_name_dot_last_initial).to eq ("michael.t@flatironschool.com")
  end

  it "should return a formatted email with firstinitial.lastname" do
    expect(client.first_initial_dot_last_name).to eq ("m.tejada@flatironschool.com")
  end

  it "should return a formatted email with firstinitial.lastinitial" do
    expect(client.first_initial_dot_last_initial).to eq ("m.t@flatironschool.com")
  end

  it "should return a formatted if given a specific company url" do
    expect(client1.find_email).to eq (["peter.wong@alphasights.com"])
    expect(client2.find_email).to eq (["craig.s@google.com", "c.silverstein@google.com"])
    expect(client3.find_email).to eq (["s.w@apple.com"])
  end


end