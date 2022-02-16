require "rails_helper"

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many :user_parties}
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    subject { Party.new(duration: "120", day: "11/11/11", start_time: "7:00") }

    describe '#duration' do
      it { should validate_presence_of :duration }
      it { should_not allow_value(nil).for(:duration) }
    end

    describe '#day' do
      it { should validate_presence_of :day }
      it { should_not allow_value(nil).for(:day) }
    end

    describe '#start_time' do
      it { should validate_presence_of :start_time }
      it { should_not allow_value(nil).for(:start_time) }
    end
  end

   describe 'instance methods' do
     it 'should return users that are in a hash key' do
      user_1 = User.create!(name: "Jim", email: "Jim@email.com", password: 'password123', password_confirmation: 'password123')
      user_2 = User.create!(name: "Jeff", email: "Jeff@email.com", password: 'password123', password_confirmation: 'password123')
      user_3 = User.create!(name: "Jill", email: "Jill@email.com", password: 'password123', password_confirmation: 'password123')
      party_1 = user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1)
      params_hash = {
        "Jeff@email.com" => 1,
        "Jill@email.com" => 1
      }

      expect(party_1.find_invitee(params_hash)).to eq([user_2, user_3])
    end
  end
end
