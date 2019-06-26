class BatchesController < ApplicationController

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)

    if @batch.save
      redirect_to batch_path(@batch)
    else
      render :new
    end
  end

  def show
    content = FetchContentService.new.('macos', 0) # TODO: Implement another service for fetching the count info

    @total_steps = content[:total]
    @batch = Batch.find_by!(slug: params[:slug])
  end

  private

  def batch_params
    params.require(:batch).permit(:slug)
  end


end
