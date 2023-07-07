require "rails_helper"

RSpec.describe "order_states/edit", type: :view do
  before(:each) do
    @order_state = assign(:order_state, OrderState.create!(
      name: "MyString",
      time_in_minutes: 1,
    ))
  end

  it "renders the edit order_state form" do
    render

    assert_select "form[action=?][method=?]", order_state_path(@order_state), "post" do
      assert_select "input[name=?]", "order_state[name]"

      assert_select "input[name=?]", "order_state[time_in_minutes]"
    end
  end
end
