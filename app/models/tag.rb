# == Schema Information
#
# Table name: tags
#
#  id   :bigint           not null, primary key
#  name :string           not null
#

class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
