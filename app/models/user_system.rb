class UserSystem < ActiveRecord::Base
  validates :browser, presence: true
  has_many :payload_requests
end