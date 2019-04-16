class CreateSwimEventTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_event_times do |t|
      t.integer :swimmer_id
      t.integer :event_id
      t.integer :time

      t.timestamps
    end
  end
end
