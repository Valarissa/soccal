require 'spec_helper'

describe "media/new" do
  before(:each) do
    assign(:medium, stub_model(Medium,
      :shareable_id => 1,
      :shareable_type => "MyString",
      :shared_id => 1,
      :shared_type => "MyString"
    ).as_new_record)
  end

  it "renders new medium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => media_path, :method => "post" do
      assert_select "input#medium_shareable_id", :name => "medium[shareable_id]"
      assert_select "input#medium_shareable_type", :name => "medium[shareable_type]"
      assert_select "input#medium_shared_id", :name => "medium[shared_id]"
      assert_select "input#medium_shared_type", :name => "medium[shared_type]"
    end
  end
end
