class UsersController < Clearance::UsersController
  respond_to :html, :js

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Sucessfully registered to BnB There!"
        redirect_back_or url_after_create
      else
        respond_with( @user, :layout => !request.xhr? )
      end
  end

private

 def user_params
   params.require(:user).permit(:email, :password, :first_name, :last_name, :country, :phone_number)
 end

end
