class Api::PagesController < ApplicationController
  def index
    render 'index.json.jb'
  end
end
