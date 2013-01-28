require 'spec_helper'

describe "event_times/edit" do
  before(:each) do
    @event_time = assign(:event_time, stub_model(EventTime,
      :event_id => 1
    ))
  end

  it "renders the edit event_time form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_times_path(@event_time), :method => "post" do
      assert_select "input#event_time_event_id", :name => "event_time[event_id]"
    end
  end
end
