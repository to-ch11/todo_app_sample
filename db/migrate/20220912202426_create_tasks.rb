class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.integer :repeat
      t.string :place
      t.text :content
      t.integer :rank

      t.timestamps
    end
  end
end
