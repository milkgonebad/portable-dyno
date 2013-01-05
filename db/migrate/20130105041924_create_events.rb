class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :event_start_date
      t.date :event_end_date
      t.time :event_start_date_time
      t.time :event_end_date_time
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :description
      t.boolean :publish

      t.timestamps
    end
  end
end
