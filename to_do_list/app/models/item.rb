class Item < ApplicationRecord
  belongs_to :card
  enum condition{ "public": 0,  "private": 1 }
  enum status{ "incomplete": 0, "done": 1 }
end
