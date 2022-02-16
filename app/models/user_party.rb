class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :user_id,
            :presence => {message: "can't be blank"}
  validates :party_id,
            :presence => {message: "can't be blank"}
end
