require File.join(File.dirname(__FILE__), '../spec_helper')

describe Calendar do
  describe '::month_of' do
    it 'gives the date range for a month and the full weeks it begins and ends on' do
      start_week = Date.today.beginning_of_month.beginning_of_week(:sunday)
      end_week = Date.today.end_of_month.end_of_week(:sunday)
      Calendar.month_of(Date.today).should == (start_week..end_week)
    end
  end

  describe '::week_of' do
    it 'gives the date range for the week of the given day' do
      start_day = Date.today.beginning_of_week(:sunday)
      end_day = Date.today.end_of_week(:sunday)
      Calendar.week_of(Date.today).should == (start_day..end_day)
    end
  end
end
