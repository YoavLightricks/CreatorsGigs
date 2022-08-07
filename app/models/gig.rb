class Gig < ApplicationRecord
  include AASM

  belongs_to :creator
  has_one :gig_payment

  aasm column: 'state' do
    state :applied, initial: true
    state :accepted
    state :completed
    state :paid

    event :accept do
      transitions from: :applied, to: :accepted
    end

    event :complete do
      transitions from: :accepted, to: :completed
      after do
        do_it
      end
    end

    event :paid do
      transitions from: :completed, to: :paid
    end

  end


  def do_it
    GigPayment.create(gig_id: self.id)
  end


end
