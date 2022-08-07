# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "cron_log.log"
set :environment, :development
#
 every 1.minute do
    #   command "/usr/bin/some_great_command"
    #     runner "GigPayment.update_pending"
    #rails printonscreen"
    # runner "GigPayment.update_all_gigp"
   rake 'batch:do_something'
 end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
