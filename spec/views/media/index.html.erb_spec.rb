require 'spec_helper'

describe "media/index" do
  before(:each) do
    assign(:media, [
      stub_model(Medium,
        :shareable_id => 1,
        :shareable_type => "Shareable Type",
        :shared_id => 2,
        :shared_type => "Shared Type"
      ),
      stub_model(Medium,
        :shareable_id => 1,
        :shareable_type => "Shareable Type",
        :shared_id => 2,
        :shared_type => "Shared Type"
      )
    ])
  end

  it "renders a list of media" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Shareable Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Shared Type".to_s, :count => 2
  end
end
