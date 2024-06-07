require 'rails_helper'

RSpec.describe Show, type: :model do
    describe 'Associations' do
        it { should belong_to(:channel) }
    end

    describe 'Validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:start_time) }
        it { should validate_presence_of(:end_time) }
        it { should validate_presence_of(:channel_id) }
    end
end