require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :action => "Action",
        :actuator => nil
      ),
      Task.create!(
        :action => "Action",
        :actuator => nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
