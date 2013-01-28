require 'spec_helper'

describe "media/edit" do
  before(:each) do
    @medium = assign(:medium, stub_model(Medium,
      :shareable_id => 1,
      :shareable_type => "MyString",
      :shared_id => 1,
      :shared_type => "MyString"
    ))
  end

  it "renders the edit medium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => media_path(@medium), :method => "post" do
      assert_select "input#medium_shareable_id", :name => "medium[shareable_id]"
      assert_select "input#medium_shareable_type", :name => "medium[shareable_type]"
      assert_select "input#medium_shared_id", :name => "medium[shared_id]"
      assert_select "input#medium_shared_type", :name => "medium[shared_type]"
    end
  end
end
