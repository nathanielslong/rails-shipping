class HomeController < ApplicationController
  :authenticate_user!, :only => [:index, :new]
  def index
  end
end
