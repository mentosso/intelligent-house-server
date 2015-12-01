require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET dashboard' do
    before(:each) do
      @sensor = FactoryGirl.create(:sensor)
      @temp = FactoryGirl.create_list(:temperature_data, 60,
                                      sensor_id: @sensor.id)
      t_temp = Time.zone.now
      @t_now = Time.new(t_temp.year, t_temp.month, t_temp.day,
                        t_temp.hour, t_temp.min, 0, Time.zone.now.strftime('%:z'))
      @temp.each_with_index do |temp, index|
        temp.update_attributes(created_at: Time.zone.now - index.minutes)
      end
      @user = FactoryGirl.create(:user)
      sign_in @user
      get :dashboard
    end
    it { is_expected.to respond_with :ok }
    it { expect(response.body.size).to eq(44) }
  end

  describe 'GET temp_chart' do
    before(:each) do
      @sensor = FactoryGirl.create(:sensor)
      @temp = FactoryGirl.create_list(:temperature_data, 60,
                                      sensor_id: @sensor.id)
      t_temp = Time.zone.now
      @t_now = Time.new(t_temp.year, t_temp.month, t_temp.day,
                        t_temp.hour, t_temp.min, 0, Time.zone.now.strftime('%:z'))
      @temp.each_with_index do |temp, index|
        temp.update_attributes(created_at: Time.zone.now - index.minutes)
      end
      @user = FactoryGirl.create(:user)
      sign_in @user
      get :temp_chart
    end
    it { is_expected.to respond_with :ok }
  end
end
