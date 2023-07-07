require "rails_helper"

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        username: "Username",
        password_digest: "password_digest",
        usertype: 2,
      ),
      User.create!(
        username: "Username",
        password_digest: "password_digest",
        usertype: 2,
      ),
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "password_digest".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
