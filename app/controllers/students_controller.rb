class StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :update]

  def edit
    content = FetchContentService.new.(current_student.os, 0)
    @title = content[:title]
    @content = content[:body]
  end

  def update
  end

  private

  def find_student
    @student = Student.find(session[:student_id])
  end

end
