class CreateExerciseClasses < ActiveRecord::Migration
  def change
    create_table :exercise_classes do |t|
      t.string :name
      t.string :day
      t.integer :duration
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :exercise_classes, [:user_id, :created_at]
  end
end
