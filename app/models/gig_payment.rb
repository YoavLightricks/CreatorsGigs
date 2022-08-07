class GigPayment < ApplicationRecord
  include AASM

  belongs_to :gig

  aasm column: 'state' do
    state :pending, initial: true
    state :complete

    event :complete do
      transitions from: :pending, to: :complete
      after do
        payment_complete
      end
    end
  end

  def payment_complete
    @selectedgig = Gig.find(self.gig_id)
    @selectedgig.paid
    @selectedgig.save
  end

  def update_all_gigp
    GigPayment.each do |gigp|
      gigp.payment_complete
    end
  end

end
