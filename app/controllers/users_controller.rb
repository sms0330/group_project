class UsersController < ApplicationController
      def new
            @user = User.new
      end

      def create
            @user = User.new user_params
            if @user.save
                  session[:user_id] = @user.id
                  redirect_to root_path, notice: "Logged in!"
            else
                  render :new
            end
      end

      def dashboard
            if current_user.is_admin?
              @user_number = User.all.count
              @facility_number = Facility.all.count
              @course_number = Course.all.count
            else
              redirect_to root_path, alert: "Only administrator can access it!"
            end
      end  

      private

      def user_params
            params.require(:user).permit(:is_teacher, :first_name, :last_name, :email, :password, :password_confirmation)  
      end
end
