class ApplicationController < ActionController::Base

  def current_student
    @current_student ||= Student.find(session[:student_id])
  end

end
