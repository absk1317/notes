class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false
      t.text :body

      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
