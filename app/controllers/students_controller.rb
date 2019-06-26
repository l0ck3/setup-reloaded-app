class StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :update]

  def edit
    @step = @student.steps.count
    content = FetchContentService.new.(current_student.os, @step)
    @title = content[:title]
    @content = content[:body]
  end

  def update
    fail
  end

  private

  def find_student
    @student = Student.find(session[:student_id])
  end

end
