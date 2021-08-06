class FacilitiesController < ApplicationController
    before_action :find_facility_id, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    # before_action :authorize_user!, only: [:edit, :update, :destroy]

    def index
        @facilities = Facility.all.order(created_at: :desc)
    end

    def show
    end

    def new
        @facilities = Facility.new 
    end

    # def book
    #     if @facility.book params.require(:facility).permit(:book)
    #         flash[:notice] = 'Facility booked!'
    #         redirect_to facility_path(@facility)
    #     else
    #         flash[:notice] = 'Error!'
    #         redirect_to _facility_path(@facility)            
    #     end      
    # end

    def create
        @facility = Facility.new facility_params
        @facility.user = current_user
        if @facility.save
            flash[:notice] = 'Facility created!'
            redirect_to facilities_path
        else
            flash[:notice] = 'Error!'
            redirect_to new_facility_path(@facilities)
        end
    end

    def edit 
    end

    def update
        @facility.user = current_user
        if current_user.is_admin?
            if can? :crud, @facility
                if @facility.update facility_params
                    flash[:notice] = 'Facility updated!'
                    redirect_to facility_path(@facility)
                else
                    flash[:notice] = 'Error!'
                    redirect_to new_facility_path(@facilities)
                end
            else
                redirect_to root_path, alert: "Not authorized!"
            end
        elsif current_user.is_teacher?
            if can? :read, :update, @facility
                if @facility.update params.require(:facility).permit(:book)
                    flash[:notice] = 'Facility booked!'
                    redirect_to facility_path(@facility)
                else
                    flash[:notice] = 'Error!'
                    redirect_to new_facility_path(@facilities)
                end
            else
                redirect_to root_path, alert: "Not authorized!"
            end
        else
            redirect_to root_path, alert: "Not authorized!"
        end
    end

    def destroy 
        @facility.destroy
        flash[:notice] = 'Facility deleted!'
        redirect_to facilities_path
    end
    
    private

    def facility_params
        params.require(:facility).permit(:name, :book, :description)
    end
    
    def find_facility_id
        @facility = Facility.find params[:id]
    end

    # def authorize_user!
    #     redirect_to root_path, alert: 'Not authorized! please try again' unless can?(:crud, @facility)
    # end

end
