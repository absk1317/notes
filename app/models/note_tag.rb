# == Schema Information
#
# Table name: note_tags
#
#  id      :bigint           not null, primary key
#  note_id :bigint
#  tag_id  :bigint
#
# Indexes
#
#  index_note_tags_on_note_id             (note_id)
#  index_note_tags_on_note_id_and_tag_id  (note_id,tag_id) UNIQUE
#  index_note_tags_on_tag_id              (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (tag_id => tags.id)
#

class NoteTag < ApplicationRecord
  belongs_to :note
  belongs_to :tag

  validates :note, :tag, presence: true
  validates :note, uniqueness: { scope: :tag, message: "already has this tag" }
end
