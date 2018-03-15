class StatisticsController < ApplicationController

  def show
    @stat_user = StatisticUser.find(params[:id])
  end

  def create
    user_data = HTTParty.get("https://www.instagram.com/#{params[:nick]}/?__a=1")
    unless user_data["graphql"].nil?
      stat_user = StatisticUser.find_or_create_by(instagram_id: user_data["graphql"]["user"]["id"]) do |user|
        user.name  =  user_data["graphql"]["user"]["full_name"]
        user.nick  =  user_data["graphql"]["user"]["username"]
        user.image =  user_data["graphql"]["user"]["profile_pic_url_hd"]
      end
      statistic = Statistic.new(followers_count:  user_data["graphql"]["user"]["edge_followed_by"]["count"],
                                followings_count: user_data["graphql"]["user"]["edge_follow"]["count"],
                                media_count: user_data["graphql"]["user"]["edge_owner_to_timeline_media"]["count"])
      stat_user.statistics << statistic
      if stat_user.save
        redirect_to statistic_path(stat_user)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path(status: 'not-found')
    end
  end

end