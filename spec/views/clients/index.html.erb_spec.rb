require "rails_helper"

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        firstname: "Firstname",
        lastname: "lastname",
        email: "Email",
        direction: "Direction",
        password_digest: "password_digest",
        enabled: false,
      ),
      Client.create!(
        firstname: "Firstname",
        lastname: "lastname",
        email: "Email",
        direction: "Direction",
        password_digest: "password_digest",
        enabled: false,
      ),
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", text: "Firstname".to_s, count: 2
    assert_select "tr>td", text: "lastname".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Direction".to_s, count: 2
    assert_select "tr>td", text: "password_digest".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
