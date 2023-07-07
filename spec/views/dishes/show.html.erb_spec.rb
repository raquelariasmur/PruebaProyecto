require "rails_helper"

RSpec.describe "dishes/show", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      name: "Name",
      description: "Description",
      price: 2,
      photography: "Photography",
      state: false,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Photography/)
    expect(rendered).to match(/false/)
  end
end
