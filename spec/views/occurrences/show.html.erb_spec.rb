require 'spec_helper'

describe "occurrences/show" do
  before(:each) do
    @occurrence = assign(:occurrence, stub_model(Occurrence,
      :event_time_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
