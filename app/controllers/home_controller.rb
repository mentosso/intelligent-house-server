class HomeController < ApplicationController
  before_action :authenticate_user!, except: :check
  respond_to :json

  def index
  end

  def check
    render json: user_signed_in?
  end

  def dashboard
    avg_temp = TemperatureData.last(100).to_a.sum(&:temp) / 100.to_f
    avg_humid = HumidityData.last(100).to_a.sum(&:humid) / 100.to_f
    sensors = Sensor.where(state: true).count
    res = {
      avg_temp: avg_temp,
      avg_humid: avg_humid,
      sensors: sensors
    }
    render json: res
  end

  def temp_chart
    t_temp = Time.now
    t_now = Time.new(t_temp.year, t_temp.month, t_temp.day,
                     t_temp.hour, t_temp.min)
    temperature_data = TemperatureData.includes(:sensor).where(created_at: (t_now - 1.hour..t_now))
    data = []
    time = create_labels(t_now)
    Sensor.all.each do |sensor|
      temp_data = []
      (0..59).reverse_each do |amount|
        temperature = temperature_data.select do |val|
          val.sensor_id == sensor.id &&
          val.created_at > t_now - amount.minute &&
          val.created_at <= t_now - amount.minute + 1.minute
        end
        temp_data << temperature.sum(&:temp) / temperature.length.to_f
      end
      data << temp_data
    end
    render json: [data, time, Sensor.all.pluck(:number)]
  end

  def create_labels(time)
    arr = []
    (0..59).reversed_each do |amount|
      arr << (time - amount.minute).strftime('%R')
    end
    arr
  end
end
