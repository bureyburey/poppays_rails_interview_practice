class GigPaymentsController < ApplicationController
  def index
    @gig_payments = GigPayment.all

    render jsonapi: @gig_payments
  end

  def show
    @gig_payment = GigPayment.find(params[:id])

    render jsonapi: @gig_payment
  end

  def create
    @gig_payment = GigPayment.create(gig_id: params[:gig_id])

    render jsonapi: @gig_payment
  end

  def update
    @gig_payment = GigPayment.find(params[:id])
    @gig_payment.update(gig_id: params[:gig_id], state: params[:state])

    render jsonapi: "GigPayment #{@gig_payment.id} has been updated"
  end

  def destroy
    @gig_payment = GigPayment.find(params[:id])
    @gig_payment.destroy

    render jsonapi: "GigPayment #{@gig_payment.id} has been deleted"
  end

  def set_complete
    @gig_payment = GigPayment.find(params[:id])
    @gig_payment.set_complete!

    render jsonapi: @gig_payment
  end
end
