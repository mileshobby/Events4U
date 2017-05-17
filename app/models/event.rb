class Event < ApplicationRecord
  validates :title, :short_description, :full_description, :image_url,
    :date, :host_id, :price, :street_address, :city_state_zip, presence: true

  belongs_to :host,
    foreign_key: :host_id, class_name: "User"

end
