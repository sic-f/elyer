class UsersController < Clearance::UsersController
  layout false

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] =
        "Welcome #{@user.first_name} #{@user.last_name}!"
      redirect_back_or url_after_create
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
