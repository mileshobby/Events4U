class ChangeDefaultImage < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:events, :image_url,
    "http://res.cloudinary.com/events4u/image/upload/v1495234870/crowd-at-concert-2_s7x3bk.jpg")
  end
end
