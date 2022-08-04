namespace :gig_payments do
  desc "TODO"
  task update_task: :environment do
    puts "Running gig_payments:update_task"
    @gig_payments = GigPayment.where(state: 'pending')
    @gig_payments.each do |gig_payment| gig_payment.set_complete! end
  end
end
