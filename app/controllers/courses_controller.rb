class CoursesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def home
    end

    def index 
        @courses = Course.all.order(:category)
    end

    def show
        @course = Course.find params[:id]
    end

    def new
        @course = Course.new
    end

    def create 
        @course = Course.new params.require(:course).permit(:title, :category, :description, :seats, :start_date, :end_date, :time)
        @course.user = current_user
        if @course.save
            flash[:notice] = "Course created successfully!"
            redirect_to course_path(@course.id)
        else
            render :new
        end
    end

    def edit
        @course = Course.find params[:id]
    end

    def update
        @course = Course.find params[:id]

        if @course.update params.require(:course).permit(:title, :category, :description, :seats, :start_date, :end_date, :time)
            flash[:notice] = 'Course has been updated!'
            redirect_to course_path(@course.id)
        else
            flash[:notice] = 'Error!'
        end
    end

    def destroy
        @course = Course.find params[:id]
        @course.destroy
        flash[:notice] = 'Course has been deleted'
        redirect_to courses_path
    end

end
