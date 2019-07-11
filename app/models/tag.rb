# == Schema Information
#
# Table name: tags
#
#  id   :bigint           not null, primary key
#  name :string           not null
#

class Tag < ApplicationRecord
  has_many :note_tags, dependent: :destroy
  has_many :notes, through: :note_tags

  validates :name, presence: true
  validates :name, uniqueness: true
end
