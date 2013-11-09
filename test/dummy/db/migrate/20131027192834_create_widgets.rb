class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.belongs_to :manufacturer
      t.string :name

      t.timestamps
    end
  end
end

