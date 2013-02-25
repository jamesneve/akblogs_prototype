class Site < ActiveRecord::Base
  attr_accessible :name, :rss, :url

  validates :name, presence: true, length: { maximum: 50 }
  validates :rss, presence: true
  validates :url, presence: true
end
# == Schema Information
#
# Table name: sites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  rss        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

