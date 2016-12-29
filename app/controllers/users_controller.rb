class UsersController < Clearance::UsersController
  before_action :find_user, only: [:show, :edit, :update]
  respond_to :html, :js

  def index
    @users = User.all
    if current_user.customer?
      flash[:notice] = "Access denied."
      return redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def show
    @bookings = @user.bookings
  end

  def edit
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

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated"
      redirect_to @user
    else
      flash[:danger] = "Sorry, something went wrong. Try again later."
      render :edit
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

private

 def user_params
   params.require(:user).permit(:email, :password, :first_name, :last_name, :country, :phone_number, :avatar)
 end

end
