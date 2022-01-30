class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy, :edit, :update, :invite]

    def index
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true).page(params[:page])
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(strong_params)
    
        if @user.save
               redirect_to users_url, flash: { success: t('users.alerts.user_saved')}
        else
                flash[:danger] = t('users.alerts.user_not_saved')
                render :new
        end
    end
    
    def update
        if @user.update(strong_params)
                redirect_to user_url(@user), flash: { success: t('users.alerts.user_updated')}
        else
            flash[:danger] = t('users.alerts.user_not_updated')
            render :edit
        end
    end
    
    def destroy
        @user.destroy
        redirect_to users_url
    end
 
    def invite
        @user.invite!(strong_params)
        redirect_to users url
    end

    private
    
    def strong_params
            params.require(:user).permit(:first_name, :last_name, :department_id, :email, :user_type_id)
    end
    
    def set_user
            @user = User.find(params[:id])
    end

end
