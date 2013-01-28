class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.integer   :event_time_id
      t.date_time :start
      t.date_time :end
      t.text      :location

      t.timestamps
    end
  end
end
