class Card < ApplicationRecord
  belongs_to :list
  has_many :items
  has_many :requesters

validates :title, presence: true, length: {maximum:50}
validates :description, presence: true, length: {maximum:40}
end
