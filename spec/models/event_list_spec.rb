require File.join(File.dirname(__FILE__), '../spec_helper')

describe EventList do
  before :each do
    EventList.clear
  end

  describe '::clear' do
    it 'sets @events' do
      e1 = Event.new
      expect { EventList.clear }.to change{EventList.event_pool}.from([e1]).to([])
    end
  end

  describe 'events' do
    it 'returns an empty array if there are no events' do
      EventList.events.should == []
    end

    it 'return an array of Events if they exist' do
      e1 = Event.new
      e2 = Event.new
      e3 = Event.new
      subject.events.should == [e1, e2, e3]
    end
  end

  (%w'upcoming current past').each do |status|
    describe "##{status}_events" do
      it "only retrieves #{status} events" do
        e0 = Event.new(status: 'upcoming')
        e1 = Event.new(status: 'current')
        e2 = Event.new(status: 'past')
        result = subject.send("#{status}_events")
        result.should have(1).item
        result.first.status.should == "#{status}"
      end
    end
  end
end
