class Event < ApplicationRecord
  validates :title, :short_description, :full_description,
    :date, :host_id, :price, presence: true

  belongs_to :host,
    foreign_key: :host_id, class_name: "User"

end
