# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# env :PATH, ENV['PATH']
# set :output, "log/cron.log"
# set :environment, :development

ENV.each { |k, v| env(k, v) }

# set logs and environment
# set :output, {:standard => "#{path}/log/cron.log", :error => "#{path}/log/cron_error.log"}
set :output, "log/cron.log"
set :environment, :development

# whenever --clear-crontab
# whenever --update-crontab --set environment='development'
every 1.minutes do
  rake "gig_payments:update_task"
end