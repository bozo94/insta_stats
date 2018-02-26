class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    @resource = User.new(sign_up_params)
    respond_to do |format|
      if @resource.save
        if @resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_up(resource_name, @resource)
          format.json {render :success => true}
          format.js
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          format.json {render :success => true}
          format.js
        end
      else
        clean_up_passwords @resource
        format.json {render :success => false, :errors => @resource.errors}
        format.js
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
  end

end