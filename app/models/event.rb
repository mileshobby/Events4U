class Event < ApplicationRecord
  validates :title, :full_description,
    :date, :host_id, :price, :venue, presence: true

  belongs_to :host,
    foreign_key: :host_id, class_name: "User"

end
