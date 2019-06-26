class StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :update]

  def edit
  end

  def update
  end

  private

  def find_student
    @student = Student.find(session[:student_id])
  end

end
