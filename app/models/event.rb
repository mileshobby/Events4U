class Event < ApplicationRecord
  validates :title, :full_description,
    :date, :host_id, :price, :venue, presence: true

  belongs_to :host,
    foreign_key: :host_id, class_name: "User"

  has_many :event_categories

  has_many :categories,
    through: :event_categories,
    source: :category

  after_initialize :give_default_image_unless_provided

  def give_default_image_unless_provided
    if self.image_url == ""
      self.image_url = "http://res.cloudinary.com/events4u/image/upload/v1495234870/crowd-at-concert-2_s7x3bk.jpg"
    end
  end

end
