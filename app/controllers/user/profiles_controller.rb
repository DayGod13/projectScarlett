class User::ProfilesController < ApplicationController
    before_action :authenticate_user!

    def new
        @profile = Profile.new
    end

    def create
        @profile = current_user.create_profile(profile_params)
        redirect_to user_profile_path(@profile)
    end

    def show
        @profile = Profile.find(params[:id])
    end

    private

    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :nickname, :age, :sex)
    end
end
