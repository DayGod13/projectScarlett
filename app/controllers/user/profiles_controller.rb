class User::ProfilesController < ApplicationController

    before_action :authenticate_user!, on: :create
    before_action :get_profile, only [:edit, :update]
    before_action :require_authorized_for_user_profile, on: :create
    attr_accessor :profile, :user_profile

    def new
        @profile = Profile.new
    end

    def create
        @profile = current_user.create_profile(profile_params)
        
        if @profile.valid?
            redirect_to user_profile_path(@profile)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        @profile.update_attributes(profile_params)
        redirect_to user_profile_path(@profile)
    end


    private

    def require_authorized_for_user_profile
        if user_profile.user != current_user
            render plain: "Unauthorized", status: :unauthorized
        end
    end

    helper_method :user_profile
    def user_profile
        @user_profile ||= Profile.find(params[:id])
    end

    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :nickname, :age, :sex, :avatar)
    end

    def get_profile
        @profile = current_user.profile
    end 
end
