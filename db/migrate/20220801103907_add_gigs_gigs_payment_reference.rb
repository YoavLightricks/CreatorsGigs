class AddGigsGigsPaymentReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :gig_payments, :gig, index: true
    add_foreign_key :gig_payments, :gigs
  end
end