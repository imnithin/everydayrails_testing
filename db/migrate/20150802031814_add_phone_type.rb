class AddPhoneType < ActiveRecord::Migration
  def up
    add_column :phone_numbers, :phone_type, :string
  end

  def down
    remove_column :phone_numbers, :phone_type
  end
end
