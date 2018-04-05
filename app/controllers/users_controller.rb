class UsersController < ApplicationController
      def show
        @user = User.find(params[:id])
        @commented_restaurants = @user.restaurants.uniq
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
      end

      def index
        @users = User.all
      end

      private

      def user_params
        params.require(:user).permit(:name,:intro,:image)
      end
end
