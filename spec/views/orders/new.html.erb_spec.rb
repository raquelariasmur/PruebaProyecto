require "rails_helper"

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      total: 1,
      subtotal: 1,
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[subtotal]"
    end
  end
end
