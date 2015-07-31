class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :number
      t.references :contact

      t.timestamps
    end
    add_index :phone_numbers, :contact_id
  end
end
