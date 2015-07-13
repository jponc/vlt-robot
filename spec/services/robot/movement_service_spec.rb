require 'rails_helper'
describe Robot::MovementService do
  let(:user) { FactoryGirl.create(:user) }
  let(:robot) { FactoryGirl.create(:robot, user: user) }
  let(:service) { Robot::MovementService.new(robot) }

  describe '#movement' do
    before do
      service.stubs(:last_position).returns(last_position)
    end
    context 'last position is present' do
      let(:last_position) { FactoryGirl.create(:position, robot: robot) }

      context 'action is move' do
        it 'calls move method' do
          service.expects(:move)
          service.movement('move')
        end
      end

      context 'action is left' do
        it 'calls left method' do
          service.expects(:left)
          service.movement('left')
        end
      end

      context 'action is right' do
        it 'calls move method' do
          service.expects(:move)
          service.movement('move')
        end
      end
    end

    context 'last position is not present' do
      let(:last_position) { nil }
      it 'returns an error message' do
        resp = service.movement('test')
        expect(resp[:success]).to be_falsey
        expect(resp[:errors]).to include 'Cannot move. No robot in the battlefield!'
      end
    end
  end

  describe '#move' do
    let(:last_position) { FactoryGirl.create(:position, robot: robot, facing: 'south', x_pos: x_pos ) }
    before do
      service.stubs(:last_position).returns(last_position)
    end

    context 'new position is within the table' do
      let(:x_pos) { 1 }

      it 'returns the new position' do
        resp = service.move
        expect(resp[:success]).to be_truthy
        expect(resp[:errors]).to be_empty
        expect(resp[:new_position]).to be_present
      end
    end

    context 'new position is outside the table' do
      let(:x_pos) { 0 }
      it 'returns an error message' do
        resp = service.move
        expect(resp[:success]).to be_falsey
        expect(resp[:errors]).to include "Sir I'm going to fall. Please take care."
      end
    end

  end

  describe '#left' do
    let(:current_index) { 1 }
    before { service.stubs(:current_index).returns(current_index) }
    it 'calls change_position_facing with new index' do
      service.expects(:change_position_facing).with(current_index - 1)
      service.left
    end
  end

  describe '#right' do
    before { service.stubs(:current_index).returns(current_index) }
    context 'current index is 3' do
      let(:current_index) { 3 }
      it 'calls change_position_facing with index 0' do
        service.expects(:change_position_facing).returns(0)
        service.right
      end
    end
    context 'current index is less than 3' do
      let(:current_index) { 1 }
      it 'calls change_position_facing with index plus 1' do
        service.expects(:change_position_facing).returns(current_index + 1)
        service.right
      end
    end
  end

  describe '#change_position_facing' do
    let(:last_position) { FactoryGirl.create(:position, robot: robot) }
    before { service.stubs(:last_position).returns(last_position) }
    it 'returns with new position' do
      resp = service.change_position_facing(2)
      expect(resp[:success]).to be_truthy
      expect(resp[:new_position]).to be_present
    end
  end
end
