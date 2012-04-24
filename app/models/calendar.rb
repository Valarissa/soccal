class Calendar
  include MongoMapper::Document

  key   :title, String
  #one   :privacy_role

  # User relation
  key   :user_ids, Array
  many  :users, :in => :user_ids

  # Event relation
  key   :event_ids, Array
  many  :events, :in => :event_ids


  ##
  # Adds a user to the calendar, if reciprocate is true add calendar to user
  def add_user(user, reciprocate=false)
    user.add_calendar(self) if reciprocate
    self.users << user
  end
end
