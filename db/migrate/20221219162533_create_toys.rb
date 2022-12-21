class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :toy_name, null: false
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
