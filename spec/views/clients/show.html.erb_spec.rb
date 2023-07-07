require "rails_helper"

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      firstname: "Firstname",
      lastname: "lastname",
      email: "Email",
      direction: "Direction",
      password_digest: "password_digest",
      enabled: false,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/lastname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Direction/)
    expect(rendered).to match(/password_digest/)
    expect(rendered).to match(/false/)
  end
end
