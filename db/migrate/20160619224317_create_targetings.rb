class CreateTargetings < ActiveRecord::Migration
  def change
    create_table :targetings do |t|
      t.string :gender
      t.references :ad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
