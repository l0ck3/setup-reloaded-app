class StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :update]

  def edit
    @step = @student.steps.count
    content = FetchContentService.new.(current_student.os, @step)

    if content.present?
      @title = content[:title]
      @content = content[:body]
    else
      redirect_to root_path # TODO: redirect to a congrats page instead
    end
  end

  # TODO: Implement this better when we'll not be in a rush
  def update
    @step = params[:step]
    current_student.steps << @step
    current_student.save!

    redirect_to edit_students_path
  end

  private

  def find_student
    @student = Student.find(session[:student_id])
  end

end