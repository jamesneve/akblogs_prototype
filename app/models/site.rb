# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  rss        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  attr_accessible :name, :rss, :url

  validates :name, presence: true, length: { maximum: 100 }
  validates :rss, presence: true, uniqueness: true
  validates :url, presence: true

  has_many :posts, dependent: :destroy
end