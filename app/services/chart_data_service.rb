class ChartDataService
  def initialize(time, type)
    @time = Time.new(time.year, time.month, time.day,
                     time.hour, time.min, 0, Time.zone.now.strftime('%:z'))
    @arr_index = 0
    @type = type
  end

  def retrive_data
    data = []
    Sensor.where(state: true).each do |sensor|
      sensor_data = retrive_sensor_type_data(sensor)
      data << get_data_for_each_minute(sensor, sensor_data)
    end
    data
  end

  def retrive_sensor_type_data(sensor)
    if @type == 'temperature'
      return TemperatureData.where(sensor_id: sensor.id,
                                   created_at: (@time - 1.hour..@time))
    elsif @type == 'humidity'
      return HumidityData.where(sensor_id: sensor.id,
                                created_at: (@time - 1.hour..@time))
    end
  end

  def get_data_for_each_minute(sensor, sensor_data)
    data = []
    (0..59).reverse_each do |amount|
      data_minute = get_array_from_minute(amount, sensor_data, sensor, @time)
      if data_minute.present?
        data << (data_minute.sum(&:value) / data_minute.length.to_f).round(2)
      else
        data << []
      end
    end
    data
  end

  def create_labels
    arr = []
    (0..59).reverse_each do |amount|
      arr << (@time - amount.minute).strftime('%R')
    end
    arr
  end

  def get_array_from_minute(amount, arr, sensor, time)
    return if arr.nil? || arr[@arr_index..-1].nil?
    data = []
    arr[@arr_index..-1].each_with_index do |val, index|
      if val.created_at > time - amount.minute
        @arr_index = index
        break
      end
      data << val if val.sensor_id == sensor.id &&
                     val.created_at <= time - amount.minute &&
                     val.created_at > time - amount.minute - 1.minute
    end
    data
  end
end
