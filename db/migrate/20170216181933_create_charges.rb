class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
