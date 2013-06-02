class Service
  include Mongoid::Document

  attr_accessible :name, :service_id

  field :name, type: String

  has_many :plans, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end