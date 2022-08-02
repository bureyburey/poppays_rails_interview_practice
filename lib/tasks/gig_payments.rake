namespace :gig_payments do
  desc "TODO"
  task update_task: :environment do
    puts "Running gig_payments:update_task"
    GigPayment.where(state: 'pending').update_all(state: 'completed')
  end
end
