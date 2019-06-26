module BatchesHelper
  def completion_percentage(current_step, total_steps)
    current_step * 100 / total_steps
  end
end
