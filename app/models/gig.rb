class Gig < ApplicationRecord
  belongs_to :creator
  has_one :gig_payment

  include AASM

  def after_completed
    unless self.gig_payment
      @gig_payment = GigPayment.create(gig_id: self.id)
    end
  end

  aasm column: :state do
    state :applied, initial: true
    state :accepted, :completed, :paid

    event :set_paid do
      transitions from: [:applied, :accepted, :completed], to: :paid
    end

    event :set_completed do
      transitions from: :applied, to: :completed, after: :after_completed
    end
  end
end
