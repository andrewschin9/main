class Problem < ApplicationRecord
  has_many :problems
  has_many :favorites
end
