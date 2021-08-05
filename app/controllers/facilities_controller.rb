class FacilitiesController < ApplicationController

    def index
        @facilities = Facility.all
    end

    def show
        @facilities = Facility.find params[:id]
    end

    def new
        @facilities = Facility.new 
    end

    def create
        @facilities = Facility.new params.require(:facility).permit(:name, :description)

        if @facilities.save
            flash[:notice] = 'Facility created!'
            redirect_to facilities_path
        else
            flash[:notice] = 'Error!'
            redirect_to new_facility_path(@facilities)
        end
    end

    def edit 
        @facilities = Facility.find params[:id]
    end

    def update
        @facilities = Facility.find params[:id]

        if @facilities.update params.require(:facility).permit(:name, :description)
            flash[:notice] = 'Facility updated!'
            redirect_to facility_path(@facilities)
        else
            flash[:notice] = 'Error!'
            redirect_to edit_facility_path(@facilities)
        end
    end

    def destroy 
        @facilities = Facility.find params[:id]
        @facilities.destroy
        flash[:notice] = 'Facility deleted!'
        redirect_to facilities_path
    end
    



end
