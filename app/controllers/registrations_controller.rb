class RegistrationsController < ApplicationController

  before_action :find_batch, only: [:new, :create]
  before_action :find_student, only: [:edit, :update]
  before_action :count_total_steps, only: [:edit]

  def new
    @student = Student.new
  end

  def create
    @student = @batch.students.new(student_params)

    if @student.save
      session[:student_id] = @student.id
      redirect_to edit_registrations_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @student.update_attributes(student_params)
      redirect_to edit_students_path
    else
      render :edit
    end
  end

  private

  def find_batch
    @batch = Batch.find_by!(slug: params[:batch_slug])
  end

  def find_student
    @student = Student.find(session[:student_id])
  end

  def student_params
    params.require(:student).permit(:full_name, :gender, :os)
  end

  def count_total_steps
    content = FetchContentService.new.('macos', 0) # TODO: Implement another service for fetching the count info
    @total_steps = content[:total]
  end

end
