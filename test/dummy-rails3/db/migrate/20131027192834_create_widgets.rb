class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :address
      t.date :birthdate
      t.string :first_name
      t.string :last_name
      t.string :preferred_name

      t.timestamps
    end
  end
end

