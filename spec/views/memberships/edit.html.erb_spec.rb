require 'spec_helper'

describe "memberships/edit" do
  before(:each) do
    @membership = assign(:membership, stub_model(Membership,
      :role_id => 1,
      :member_type => "MyString",
      :member_id => 1
    ))
  end

  it "renders the edit membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => memberships_path(@membership), :method => "post" do
      assert_select "input#membership_role_id", :name => "membership[role_id]"
      assert_select "input#membership_member_type", :name => "membership[member_type]"
      assert_select "input#membership_member_id", :name => "membership[member_id]"
    end
  end
end
