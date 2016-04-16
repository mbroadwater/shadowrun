class CreateDefenses < ActiveRecord::Migration
  def change
    create_table :defenses do |t|
      t.references :character, index: true, foreign_key: true
      t.integer :normal_val
      t.string :type

      t.timestamps null: false
    end
  end
end
