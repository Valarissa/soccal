require 'spec_helper'

describe User do
  describe "#add_calendar" do
    let(:user){ Factory.create(:user) }
    let(:calendars){
      [
        Factory.create(:calendar),
        Factory.create(:calendar, :title => "Test 2")
      ]
    }
     
    before(:each) do
      calendars.each do |cal|
        user.add_calendar cal, true
      end
    end

    it "can be retrieved" do
      user.calendars.should eq(calendars)
    end

    it "adds the user to the calendar" do
      calendars.each do |cal|
        cal.users.should eq([user])
      end
    end
  end  
end
