class EnrollsController < ApplicationController
      def create
            @course = Course.find params[:course_id]
            @enroll = Enroll.new(course: @course, user: current_user)
            if @enroll.save
                  flash[:notice] = "Enrolled in Course"
                  redirect_to courses_path
            else
                  flash[:alert] = @enroll.errors.full_messages.join(',')
            end
      end

      def destroy
            @enroll = current_user.enrolls.find params[:id]
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
