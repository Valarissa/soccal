require 'spec_helper'

describe "media/show" do
  before(:each) do
    @medium = assign(:medium, stub_model(Medium,
      :shareable_id => 1,
      :shareable_type => "Shareable Type",
      :shared_id => 2,
      :shared_type => "Shared Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Shareable Type/)
    rendered.should match(/2/)
    rendered.should match(/Shared Type/)
  end
end
