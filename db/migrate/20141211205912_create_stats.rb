class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :age
      t.string :height_in_inches
      t.string :integer
      t.integer :weight
      t.string :wellness_goals

      t.timestamps
    end
  end
end
