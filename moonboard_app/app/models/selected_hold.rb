class SelectedHold < ApplicationRecord
  belongs_to :hold
  belongs_to :user
  belongs_to :hold_set
  belongs_to :problem
end
