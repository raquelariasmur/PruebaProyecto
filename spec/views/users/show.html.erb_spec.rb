require "rails_helper"

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      username: "Username",
      password_digest: "password_digest",
      usertype: 2,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/password_digest/)
    expect(rendered).to match(/2/)
  end
end
