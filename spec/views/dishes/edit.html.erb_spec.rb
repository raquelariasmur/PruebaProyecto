require "rails_helper"

RSpec.describe "dishes/edit", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      name: "MyString",
      description: "MyString",
      price: 1,
      photography: "MyString",
      state: false,
    ))
  end

  it "renders the edit dish form" do
    render

    assert_select "form[action=?][method=?]", dish_path(@dish), "post" do
      assert_select "input[name=?]", "dish[name]"

      assert_select "input[name=?]", "dish[description]"

      assert_select "input[name=?]", "dish[price]"

      assert_select "input[name=?]", "dish[photography]"

      assert_select "input[name=?]", "dish[state]"
    end
  end
end
