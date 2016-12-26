class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
      	flash[:notice] = "Signed In!"
        redirect_back_or url_after_create
        # home_url
      else
        respond_to do |format|
          format.html { redirect_to sign_in_url }
          format.js
        end

      end
    end
  end

end
