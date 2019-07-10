# == Schema Information
#
# Table name: note_tags
#
#  id      :bigint           not null, primary key
#  note_id :integer          not null
#  tag_id  :integer          not null
#
# Indexes
#
#  index_note_tags_on_note_id_and_tag_id  (note_id,tag_id) UNIQUE
#

class NoteTag < ApplicationRecord
  belongs_to :note
  belongs_to :tag

  validates :note, :tag, presence: true
  validates :note, uniqueness: { scope: :tag, message: "already has this tag" }
end
