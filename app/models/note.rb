# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  body       :text
#  deleted_at :datetime
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_notes_on_deleted_at  (deleted_at)
#  index_notes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Note < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :note_tags, dependent: :destroy
  has_many :tags, through: :note_tags

  validates :title, presence: true

  def self.tagged_with(name)
    Tag.find_by!(name: name)&.notes
  end

  def self.tag_counts
    Tag.select('tags.*, count(note_tags.tag_id) as count')
       .joins(:note_tags)
       .group('note_tags.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
