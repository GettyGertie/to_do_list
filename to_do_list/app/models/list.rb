class List < ApplicationRecord
 belongs_to :user
 has_many :cards
  validates :title, presence: true
end
