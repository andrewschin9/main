class User < ApplicationRecord
  has_many :problems
  has_many :favorites
end
