require 'spec_helper'

describe "occurrences/new" do
  before(:each) do
    assign(:occurrence, stub_model(Occurrence,
      :event_time_id => 1
    ).as_new_record)
  end

  it "renders new occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => occurrences_path, :method => "post" do
      assert_select "input#occurrence_event_time_id", :name => "occurrence[event_time_id]"
    end
  end
end
