class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :event_categories
  has_many :events,
    through: :event_categories,
    source: :event
end
