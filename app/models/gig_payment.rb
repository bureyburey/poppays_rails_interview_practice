class GigPayment < ApplicationRecord
  belongs_to :gig

  include AASM

  def after_close
    self.gig.set_paid!
  end

  aasm column: :state do
    state :pending, initial: true
    state :complete

    event :set_complete do
      transitions from: :pending, to: :complete, after: :after_close
    end

    # event :reopen do
    #   transitions from: :complete, to: :pending
    # end
  end
end