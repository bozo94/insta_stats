class WelcomeController < ApplicationController
  def index
    @statistic_user = StatisticUser.new
  end
end