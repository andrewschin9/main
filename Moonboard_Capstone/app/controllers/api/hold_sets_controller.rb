class Api::HoldSetsController < ApplicationController
  has_many problems
  has_many holds
end
