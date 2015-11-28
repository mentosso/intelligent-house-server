class CheckSensorStateJob < ActiveJob::Base
  queue_as :default

  def perform
    Sensor.all.each do |sensor|
      val = TemperatureData.where(sensor_id: sensor.id).last
      if val.created_at < Time.zone.now - 5.minutes
        sensor.update_attributes(state: false) if sensor.state == true
      else
        sensor.update_attributes(state: true) if sensor.state == false
      end
    end
  end
end
