class Api::ProblemsController < ApplicationController
  belongs_to hold
  belongs_to user
  belongs_to name
  belongs_to hold_set
end
