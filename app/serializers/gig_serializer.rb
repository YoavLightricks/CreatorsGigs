class GigSerializer < ActiveModel::Serializer
  attributes :id, :brand_name, :state, :creator_id

  belongs_to :creator
  has_one :gig_payment
end
