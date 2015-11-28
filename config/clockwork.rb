require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job, time|
    puts "Running #{job}, at #{time}"
  end

  every(1.minute, 'check sensor statuses') { CheckSensorStateJob.perform_now }
end
