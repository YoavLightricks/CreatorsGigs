class GigPaymentSerializer < ActiveModel::Serializer
  attributes :id, :state, :gig_id
  belongs_to :gig
end
