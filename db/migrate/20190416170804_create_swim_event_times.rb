class CreateSwimEventTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_event_times do |t|
      t.integer :event_id
      t.integer :swimmer_id
      t.integer :time
    end
  end
end
