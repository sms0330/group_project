class CoursesController < ApplicationController
    before_action :find_course_id, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
 
    def home
    end

    def index 
        @courses = Course.all.order(:category)
    end

    def show
    end

    def new
        @course = Course.new
    end

    def create 
        @course = Course.new course_params
        @course.user = current_user
        if @course.save
            flash[:notice] = "Course created successfully!"
            redirect_to course_path(@course.id)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @course.update course_params
            flash[:notice] = 'Course has been updated!'
            redirect_to course_path(@course.id)
        else
            render :edit
        end
    end

    def destroy
        @course.destroy
        flash[:notice] = 'Course has been deleted'
        redirect_to courses_path
    end

    def enrolled
        @course = Course.find params[:id].courses.select! { |s| s.user_id == current_user.id  unless s.user.is_admin?}
    end

    private

    def course_params
        params.require(:course).permit(:name, :category, :description, :seats, :start_date, :end_date, :time)
    end
    
    def find_course_id
        @course = Course.find params[:id]
    end

    def authorize_user!
        redirect_to root_path, alert: 'Not authorized! please try again' unless can?(:crud, @course)
    end
end
