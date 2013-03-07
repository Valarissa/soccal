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

  describe '#events' do
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

  describe '#within' do
    it 'returns only those events that fall within the given DateRange' do
      events = self.events
      el = EventList.new.within(DateRange.new(from: 2.days.ago, to: 2.days.from_now))
      el.events.should == [events[1]]
    end
  end

  describe '#on_calendar' do
    it 'returns only those events which belong to the given Calendar' do
      events = self.events
      events.first.calendar_id = 36
      el = EventList.new.on_calendar(Calendar.new(id: 36))
      el.events.should == [events[0]]
    end
  end

  def events
    [
      event(date_range: DateRange.new(from: 7.days.ago, to: 6.days.ago)),
      event,
      event(date_range: DateRange.new(from: 6.days.from_now, to: 7.days.from_now))
    ]
  end

  def event(options={})
    Event.new(default_event_options.merge(options))
  end

  def default_event_options
    {
      status: 'current',
      date_range: DateRange.new(:from => 1.day.ago, :to => 1.day.from_now),
      calendar: Calendar.new,
      display: 'Event'
    }
  end
end
