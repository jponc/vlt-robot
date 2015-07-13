
require 'rails_helper'

describe Api::RobotsController do
  include InitializationHelper
  let(:user) { FactoryGirl.create(:user) }
  let!(:robot) { FactoryGirl.create(:robot, user: user) }
  before do
    login(user)
  end

  describe 'POST change_position' do
    let(:position_params) do
      {x_pos: '1', y_pos: '1', facing: 'north', move_type: 'place'}
    end
    context 'robot saved' do
      it 'returns successfully including the new position' do
        post :change_position, id: robot.id, position: position_params
        json = JSON(response.body)
        expect(json['success']).to be_truthy
        expect(json['new_position'].present?).to be_truthy
      end
    end

    context 'robot not saved' do
      before do
        Position.any_instance.stubs(:save).returns(false)
      end
      it 'returns successfully including the new position' do
        post :change_position, id: robot.id, position: position_params
        json = JSON(response.body)
        expect(json['success']).to be_falsey
        expect(json['errors']).to include 'Robot position not changed.'
      end
    end
  end

  describe 'POST action' do
    let(:movement) { 'right' }
    let(:service) { stub('Robot::MovementService') }
    it 'calls movement service' do
      Robot::MovementService.expects(:new).returns(service)
      service.expects(:movement).with(movement)
      post :action, id: robot.id, movement: movement
    end
  end

  describe 'GET report' do
    let(:service) { stub('Robot::ReportService') }
    it 'calls report service' do
      Robot::ReportService.expects(:new).returns(service)
      service.expects(:report)
      post :report, id: robot.id
    end
  end
end
