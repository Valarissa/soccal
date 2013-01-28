require 'spec_helper'

describe "event_times/show" do
  before(:each) do
    @event_time = assign(:event_time, stub_model(EventTime,
      :event_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
