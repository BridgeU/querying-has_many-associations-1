class Location < ActiveRecord::Base
  belongs_to :region
  has_many :people

  scope :order_by_name, -> { order(:name) }
end
