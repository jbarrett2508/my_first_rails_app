class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :medium
      t.integer :year
      t.text :keyword

      t.timestamps
    end
  end
end
