require "rails_helper"

RSpec.describe "order_states/new", type: :view do
  before(:each) do
    assign(:order_state, OrderState.new(
      name: "MyString",
      time_in_minutes: 1,
    ))
  end

  it "renders new order_state form" do
    render

    assert_select "form[action=?][method=?]", order_states_path, "post" do
      assert_select "input[name=?]", "order_state[name]"

      assert_select "input[name=?]", "order_state[time_in_minutes]"
    end
  end
end
