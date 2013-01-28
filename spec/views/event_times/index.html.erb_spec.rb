require 'spec_helper'

describe "event_times/index" do
  before(:each) do
    assign(:event_times, [
      stub_model(EventTime,
        :event_id => 1
      ),
      stub_model(EventTime,
        :event_id => 1
      )
    ])
  end

  it "renders a list of event_times" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
