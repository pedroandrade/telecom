class Plan
  include Mongoid::Document

  attr_accessible :name, :description, :price, :service_id

  field :name, type: String
  field :description, type: String
  field :price, type: Money

  belongs_to :service

  validates_presence_of :name, :description, :price, :service_id
end