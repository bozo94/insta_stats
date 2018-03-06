module ApplicationHelper

  def statistics_row user
    template = ''
      user.statistics.each do |stat|
        template = "<tr>"
        template+="<td>#{stat.created_at.strftime("%m-%d-%Y")}</td>"
        template+="<td>#{stat.followers_count}</td>"
        template+="<td>+32</td>"
        template+="<td>#{stat.followings_count}</td>"
        template+="<td>+32</td>"
        template+="<td>#{stat.media_count}</td>"
        template+="<td>+32</td>"
        template +="</tr>"
      end

    template
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
