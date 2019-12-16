class UsersController < Clearance::UsersController
  layout 'application', only: %i[show places]
  layout 'clearance_authentication', only: %i[new create]

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = "Welcome #{@user.first_name} #{@user.last_name}!"
      redirect_back_or url_after_create
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'Account successfuly updated.'
      redirect_to @user
    else
      render :edit
    end
  end

  def places
    @places = current_user.places
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
