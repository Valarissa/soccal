class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :event_times do |t|
      t.integer   :event_id
      t.date      :start_date
      t.date      :end_date
      t.time      :start_time
      t.string    :duration
      t.string    :recurrence
      t.datetime  :next_occurrence

      t.timestamps
    end
  end
end
