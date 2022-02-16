require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :party}
  end
  describe 'validations' do
    user = User.new(name: "Jim", email: "Jim@email.com")
    party = user.parties.new(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1)

    subject { user.user_parties.new(user_id: user.id, party_id: party.id) }

    describe '#user_id' do
      it {should validate_presence_of :user_id}
      it { should_not allow_value(nil).for(:user_id) }
    end

    describe '#party_id' do
      it {should validate_presence_of :party_id}
      it { should_not allow_value(nil).for(:party_id) }
    end
  end
end
