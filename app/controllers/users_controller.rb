class UsersController < Clearance::UsersController
  layout 'application', only: %i[show places]
  layout 'clearance_authentication', only: %i[new create]

  before_action :set_user, only: %i[edit, update, destroy_avatar]

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

    if @user.update(update_params)
      flash[:success] = 'Account successfuly updated.'
      redirect_to @user
    else
      render :edit
    end
  end

  def places
    @pagy, @places = pagy(current_user.places)
  end

  def destroy_avatar
    @user.avatar.purge_later

    redirect_to @user
  end

  private
    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
    end

    def update_params
      update_params = user_params

      delete_password_if_not_present_in(update_params)

      update_params
    end

    def delete_password_if_not_present_in(update_params)
      update_params.delete(:password) if user_params[:password].blank?
    end
end
