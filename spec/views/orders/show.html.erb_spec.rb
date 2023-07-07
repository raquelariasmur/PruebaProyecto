require "rails_helper"

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      total: 3,
      subtotal: 4,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
