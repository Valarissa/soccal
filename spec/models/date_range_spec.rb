require File.join(File.dirname(__FILE__), '../spec_helper')

describe DateRange do
  let(:date_range){ DateRange.new(from: 1.day.ago, to: 1.day.from_now)}
  describe '#within?' do
    it 'returns false if it is not in a given DateRange at any point' do
      DateRange.new(from: 3.days.ago, to: 2.days.ago).within?(date_range).should == false
    end

    it 'returns true if it is within a given DateRange' do
      DateRange.new(from: 1.hour.ago, to: 1.hour.from_now).within?(date_range).should == true
    end

    it 'returns true if it ends within a given DateRange' do
      DateRange.new(from: 3.days.ago, to: 1.hour.from_now).within?(date_range).should == true
    end

    it 'returns true if it begins within a given DateRange' do
      DateRange.new(from: 1.hour.ago, to: 3.days.from_now).within?(date_range).should == true
    end

    it 'returns true if it begins before and ends after a given DateRange' do
      DateRange.new(from: 3.days.ago, to: 3.days.from_now).within?(date_range).should == true
    end
  end

  describe '#cover?' do
    it 'returns false if a given DateRange does not fall within itself' do
      date_range.cover?(DateRange.new(from: 3.days.ago, to: 2.days.ago)).should == false
    end

    it 'returns true if a given DateRange is within itself' do
      date_range.cover?(DateRange.new(from: 1.hour.ago, to: 1.hour.from_now)).should == true
    end

    it 'returns true if a given DateRange ends within itself' do
      date_range.cover?(DateRange.new(from: 3.days.ago, to: 1.hour.from_now)).should == true
    end

    it 'returns true if a given DateRange begins within itself' do
      date_range.cover?(DateRange.new(from: 1.hour.ago, to: 3.days.from_now)).should == true
    end

    it 'returns true if a given DateRange straddles it' do
      date_range.cover?(DateRange.new(from: 3.days.ago, to: 3.days.from_now)).should == true
    end
  end

  describe '#to_param' do
    it 'returns "%Y-%m-%d/%Y-%m-%d" for a given DateRange' do
      date_range.to_param.should == [1.day.ago.strftime('%Y-%m-%d'), 1.day.from_now.strftime('%Y-%m-%d')]
    end
  end
end
