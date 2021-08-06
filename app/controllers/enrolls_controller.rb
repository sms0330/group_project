class EnrollsController < ApplicationController
      def create
            @course = Course.find params[:course_id]
            @enroll = Enroll.new(course: @course, user: current_user)
            # Course.seats = Course.seats - 1
            if @enroll.save
                  flash[:notice] = "Enrolled in Course"
            else
                  flash[:alert] = @enroll.errors.full_messages.join(',')
            end
            redirect_to request.referrer
      end

      def destroy
            @enroll = current_user.enrolls.find params[:id]
            # Course.seats = Course.seats + 1
            #!can? and cannot? is the same thing
            if cannot?(:destroy, @enroll)
                  flash[:alert] = "You cannot destroy a enroll you don't own"
            elsif @enroll.destroy
                  flash[:notice] = "Course unenrolled"
            else
                  flash[:alert] = "Couldn't unenroll form the course"
            end
            redirect_to request.referrer
      end
end
