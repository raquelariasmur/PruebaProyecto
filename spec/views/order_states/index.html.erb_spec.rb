require "rails_helper"

RSpec.describe "order_states/index", type: :view do
  before(:each) do
    assign(:order_states, [
      OrderState.create!(
        name: "Name",
        time_in_minutes: 2,
      ),
      OrderState.create!(
        name: "Name",
        time_in_minutes: 2,
      ),
    ])
  end

  it "renders a list of order_states" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
