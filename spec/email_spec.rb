require_relative './spec_helper.rb'
require '../rspec_practice/email.rb'

describe "Email" do 
  let(:client) {Email.new("Michael Tejada","flatironschool.com")}
  let(:client1) {Email.new("Peter Wong","alphasights.com")}
  let(:client2) {Email.new("Craig Silverstein", "google.com")}
  let(:client3) {Email.new("Steve Wozniak","apple.com")}
  let(:client4) {Email.new("Barack Obama","whitehouse.gov")}


  it "should have a name" do 
    client.name = "Michael Tejada"
    expect(client.name).to eq("Michael Tejada")
  end

  it "should have a company url" do
    client.company = "flatironschool.com"
    expect(client.company).to eq("flatironschool.com")
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
    expect(client1.predict).to eq ("peter.wong@alphasights.com")
    expect(client2.predict).to eq ("craig.s@google.com or c.silverstein@google.com")
    expect(client3.predict).to eq ("s.w@apple.com")
    expect(client4.predict).to eq ("Sorry, no email matches for Barack Obama.")
  end


end