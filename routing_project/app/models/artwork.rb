# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  belongs_to :user,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

end