require "rails_helper"

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      firstname: "MyString",
      lastname: "MyString",
      email: "MyString",
      direction: "MyString",
      password_digest: "MyString",
      enabled: false,
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do
      assert_select "input[name=?]", "client[firstname]"

      assert_select "input[name=?]", "client[lastname]"

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[direction]"

      assert_select "input[name=?]", "client[password_digest]"

      assert_select "input[name=?]", "client[enabled]"
    end
  end
end
