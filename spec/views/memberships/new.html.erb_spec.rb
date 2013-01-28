require 'spec_helper'

describe "memberships/new" do
  before(:each) do
    assign(:membership, stub_model(Membership,
      :role_id => 1,
      :member_type => "MyString",
      :member_id => 1
    ).as_new_record)
  end

  it "renders new membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => memberships_path, :method => "post" do
      assert_select "input#membership_role_id", :name => "membership[role_id]"
      assert_select "input#membership_member_type", :name => "membership[member_type]"
      assert_select "input#membership_member_id", :name => "membership[member_id]"
    end
  end
end
