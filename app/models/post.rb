# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  image        :string(255)
#  site_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_on :datetime
#  entry_url    :string(255)
#  content      :text
#  author       :string(255)
#

class Post < ActiveRecord::Base
  attr_accessible :content, :image, :title, :published_on, :remote_image_url, :entry_url, :author

  validates :image, presence: true
  validates :title, presence: true
  validates :site_id, presence: true

  belongs_to :site

  mount_uploader :image, ThumbnailUploader
end
