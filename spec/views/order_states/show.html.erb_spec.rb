require "rails_helper"

RSpec.describe "order_states/show", type: :view do
  before(:each) do
    @order_state = assign(:order_state, OrderState.create!(
      name: "Name",
      time_in_minutes: 2,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
