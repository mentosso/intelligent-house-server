class CheckSensorStateJob < ActiveJob::Base
  queue_as :default

  def perform
    Sensor.all.each do |sensor|
      val = TemperatureData.where(sensor_id: sensor.id).last
      if val.created_at < Time.zone.now - 5.minutes && sensor.state == true
        Notification.create(message: "Sensor #{sensor.number} not responding",
                            message_type: 'error')
        sensor.update_attributes(state: false)
      elsif val.created_at > Time.zone.now - 5.minutes && sensor.state == false
        Notification.create(message: "Sensor #{sensor.number} responding",
                            message_type: 'info')
        sensor.update_attributes(state: true)
      end
    end
  end
end
