class EnrollsController < ApplicationController
      def create
            @course = Course.find params[:course_id]
            @enroll = Enroll.new(course: @course, user: current_user)
            # Course.seats = Course.seats - 1
            if @enroll.save
                  flash[:success] = "Enrolled in Course"
                  redirect_to courses_path
            else
                  flash[:danger] = @enroll.errors.full_messages.join(',')
            end
      end
      
      def edit
            @course = Course.find params[:course_id]
      end

      def destroy
            @enroll = current_user.enrolls.find params[:id]
            # Course.seats = Course.seats + 1
            #!can? and cannot? is the same thing
            if cannot?(:destroy, @enroll)
                  flash[:danger] = "You cannot destroy a enroll you don't own"
            elsif @enroll.destroy
                  flash[:success] = "Course unenrolled"
            else
                  flash[:danger] = "Couldn't unenroll form the course"
            end
            redirect_to request.referrer
      end
end
