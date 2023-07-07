require "rails_helper"

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      total: 1,
      subtotal: 1,
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[subtotal]"
    end
  end
end
