class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to "/"
      else
        render template: "users/new"
      end
  end

private

 def user_params
   params.require(:user).permit(:email, :password, :first_name, :last_name, :country, :phone_number)
 end

end
