class User::CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @profile = Profile.find(params[:profile_id])
        @profile.comments.create(comment_params.merge(user: current_user))
        @user = current_user
        redirect_to user_profile_path(@profile)
    end

    def show
        @profile = Profile.find(params[:id])
        @user = current_user
    end
    
    def update
        @profile = Profile.find(params[:id])
        @profile.update_attributes(profile_params)
        redirect_to user_profile_path(@profile)
    end


    private

    def comment_params
        params.require(:comment).permit(:comment)
    end

end
