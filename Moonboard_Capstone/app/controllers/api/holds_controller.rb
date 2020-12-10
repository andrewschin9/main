class Api::HoldsController < ApplicationController
  has_many problem
  belongs_to hold_set
end
