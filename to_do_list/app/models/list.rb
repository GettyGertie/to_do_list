class List < ApplicationRecord
  has_many :cards
  belongs_to :user
validates :title, presence: true, length: {maximum:40}, uniqueness: { case_sensitive: false  }

end
