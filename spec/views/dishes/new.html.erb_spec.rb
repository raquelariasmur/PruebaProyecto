require "rails_helper"

RSpec.describe "dishes/new", type: :view do
  before(:each) do
    assign(:dish, Dish.new(
      name: "MyString",
      description: "MyString",
      price: 1,
      photography: "MyString",
      state: false,
    ))
  end

  it "renders new dish form" do
    render

    assert_select "form[action=?][method=?]", dishes_path, "post" do
      assert_select "input[name=?]", "dish[name]"

      assert_select "input[name=?]", "dish[description]"

      assert_select "input[name=?]", "dish[price]"

      assert_select "input[name=?]", "dish[photography]"

      assert_select "input[name=?]", "dish[state]"
    end
  end
end
