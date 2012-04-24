class User
  include MongoMapper::Document

  key   :username,    String, :required => true,  :unique => true
  key   :first_name,  String, :required => true
  key   :last_name,   String, :required => true
  key   :email,               :required => true,  :unique => true

  # Calendar Relation
  key   :calendar_ids, Array
  many  :calendars, :in => :calendar_ids

  # Page Relation
  key   :page_ids, Array
  many  :pages, :in => :page_ids

  ##
  # Adds a calendar to the user, if reciprocate is true call add_user on cal
  def add_calendar(cal, reciprocate=false)
    cal.add_user(self) if reciprocate
    self.calendars << cal
  end
end
