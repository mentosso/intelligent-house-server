require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '.array' do
    before(:each) do
      @sensor = FactoryGirl.create(:sensor)
      @temp = FactoryGirl.create_list(:temperature_data, 60,
                                      sensor_id: @sensor.id)
      t_temp = Time.zone.now
      @t_now = Time.new(t_temp.year, t_temp.month, t_temp.day,
                        t_temp.hour, t_temp.min, 0, Time.zone.now.strftime('%:z'))
    end
    it '' do
      @temp.each_with_index do |temp, index|
        temp.update_attributes(created_at: Time.zone.now - index.minutes)
      end
      binding.pry
      x = HomeController.new.get_array_from_minute(59, @temp.reverse!, 0, @sensor, @t_now)
      p x
    end
  end
end
