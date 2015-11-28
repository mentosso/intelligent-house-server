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
    service = ChartDataService.new(Time.zone.now, 'temperature')
    time = service.create_labels
    data = service.retrive_temperature_data
    render json: [data, time, Sensor.all.pluck(:number)]
  end
end
