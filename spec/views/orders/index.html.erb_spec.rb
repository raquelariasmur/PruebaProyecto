require "rails_helper"

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        total: 3,
        subtotal: 4,
      ),
      Order.create!(
        total: 3,
        subtotal: 4,
      ),
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
