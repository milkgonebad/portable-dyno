class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.datetime :send_at
      t.boolean :sent
      t.references :tweet
      t.timestamps
    end
  end
end
