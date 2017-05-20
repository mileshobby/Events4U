class Bookmark < ApplicationRecord
  validates :user, :event, presence: true
  belongs_to :user
  belongs_to :event
end
