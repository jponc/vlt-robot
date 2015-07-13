require 'rails_helper'
describe Robot::ReportService do
  let(:user) { FactoryGirl.create(:user) }
  let(:robot) { FactoryGirl.create(:robot, user: user) }
  let(:service) { Robot::ReportService.new(robot) }

  describe '#report' do
    before do
      service.stubs(:last_position).returns(last_position)
    end
    context 'last position present' do
      let(:last_position) { FactoryGirl.create(:position) }
      it 'returns the coordinates' do
        expect(service.report).to eq "Hi sir, I'm currently at (#{last_position.x_pos}, #{last_position.y_pos}) facing #{last_position.facing}."
      end

    end

    context 'last position not present' do
      let(:last_position) { nil }
      it 'returns an error message' do
        expect(service.report).to eq "No robot in the battlefield."
      end
    end
  end

  describe '#last_position' do
    let!(:position) { FactoryGirl.create(:position, robot: robot) }

    it 'returns the last position of the robot' do
      expect(service.last_position).to eq position
    end
  end
end
