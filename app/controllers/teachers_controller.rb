class TeachersController < ApplicationController
      def new
            @teacher = Teacher.new
      end

      def create
            @teacher = Teacher.new teacher_params
            if @teacher.save
                  session[:teacher_id] = @teacher.id
                  redirect_to root_path, notice: "Logged in!"
            else
                  render :new
            end
      end

      private

      def teacher_params
            params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)  
      end
end
