class Gig < ApplicationRecord
  belongs_to :creator
  has_one :gig_payment

  include AASM
  aasm column: :state do
    state :applied, initial: true
    state :accepted, :completed, :paid

    event :set_paid do
      transitions from: [:applied, :accepted], to: :paid
    end

    # event :reopen do
    #   transitions from :paid, to: :applied
    # end
  end
end
