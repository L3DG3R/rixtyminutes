class Project < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  
  validates :project_type, presence: true
  validates :platform_type, presence: true
  validates :content_type, presence: true
  validates :project_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 500}
  validates :launch_date, presence: true
end
