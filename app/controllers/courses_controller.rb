class CoursesController < ApplicationController

    def home
    end

    def index 
        @courses = Course.all.order(:category)
    end

    def show
        @courses = Course.find params[:id]
    end

    def new
        @courses = Course.new
    end

    def create 
        @courses = Course.new params.require(:course).permit(:name, :category, :description, :seats, :start_date, :end_date, :time)

        if @courses.save
            flash[:notice] = 'Course created successfully!'
        else
            flash[:notice] = 'Error!'
        end
    end

    def edit
        @courses = Course.find params[:id]
    end

    def update
        @courses = Course.find params[:id]

        if @courses.update params.require(:course).permit(:name, :category, :description, :seats, :start_date, :end_date, :time)
            flash[:notice] = 'Course has been updated!'
        else
            flash[:notice] = 'Error!'
        end
    end

    def destroy
        @courses = Course.find params[:id]
        @courses.destroy
        flash[:notice] = 'Course has been deleted'
    end

end
