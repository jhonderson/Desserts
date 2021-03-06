class UsersController < SessionsController

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    #Signup Form
    @user = User.new     
  end

  def edit 
    @user = User.find(params[:id]) 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:action => 'index') 
    else
      render "new"
    end
  end

  def update 
    @user = User.find(params[:id]) 
    if @user.update_attributes(user_params) 
      redirect_to(:action => 'index') 
    else 
      render 'edit' 
    end 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(:action => 'index') 
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :is_admin)
    end
end
