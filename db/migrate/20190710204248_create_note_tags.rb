class CreateNoteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :note_tags do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :note, foreign_key: true
    end
    add_index :note_tags, %i[note_id tag_id], unique: true
  end
end
