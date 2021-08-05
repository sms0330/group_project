class FacilitiesController < ApplicationController

    def index
        @facilities = Facility.all
    end

    def show
        @facility = Facility.find params[:id]
    end

    def new
        @facility = Facility.new 
    end

    def create
        @facility = Facility.new params.require(:facility).permit(:name, :description)

        if @facility.save
            flash[:notice] = 'Facility created!'
            redirect_to facilities_path
        else
            flash[:notice] = 'Error!'
            redirect_to new_facility_path(@facilities)
        end
    end

    def edit 
        @facility = Facility.find params[:id]
    end

    def update
        @facility = Facility.find params[:id]

        if @facility.update params.require(:facility).permit(:name, :description)
            flash[:notice] = 'Facility updated!'
            redirect_to facility_path(@facility)
        else
            flash[:notice] = 'Error!'
            redirect_to edit_facility_path(@facility)
        end
    end

    def destroy 
        @facility = Facility.find params[:id]
        @facility.destroy
        flash[:notice] = 'Facility deleted!'
        redirect_to facilities_path
    end
    



end
