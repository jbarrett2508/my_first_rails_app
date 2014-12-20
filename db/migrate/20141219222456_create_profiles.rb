class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :height_in_inches
      t.integer :weight_in_lbs
      t.string :wellness_goals
      t.belongs_to :user

      t.timestamps
    end
  end
end
