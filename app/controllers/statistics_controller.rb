class StatisticsController < ApplicationController

  def show
    @stat_user = StatisticUser.find(params[:id])
  end

  def create
    user_data = HTTParty.get("https://www.instagram.com/#{params[:nick]}/?__a=1")
    stat_user = StatisticUser.find_or_create_by(instagram_id: user_data["user"]["id"]) do |user|
      user.name  =  user_data["user"]["full_name"]
      user.nick  =  user_data["user"]["username"]
      user.image =  user_data["user"]["profile_pic_url_hd"]
    end
    statistic = Statistic.new(followers_count:  user_data["user"]["followed_by"]["count"],
                              followings_count: user_data["user"]["follows"]["count"],
                              media_count: user_data["user"]["media"]["count"])
    stat_user.statistics << statistic
    if stat_user.save
      redirect_to statistic_path(stat_user)
    else
      redirect_to root_path
    end
  end

end