# frozen_string_literal: true

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

  scope :tagged_with, lambda { |name = nil|
    joins(:tags).where('tags.name ilike ?', name) if name
  }

  validates :title, presence: true

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    tags = [names].flatten.each.map do |name|
      Tag.find_by(id: name.to_i) || Tag.where(name: name.strip).first_or_create!
    end.uniq
    self.tags = tags
  end
end
