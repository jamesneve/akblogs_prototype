# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  image        :string(255)
#  content      :text
#  site_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_on :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :content, :image, :title, :published_on

  validates :image, presence: true
  validates :title, presence: true
  validates :site_id, presence: true

  belongs_to :site
end
