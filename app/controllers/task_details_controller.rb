class TaskDetailsController < ApplicationController
  before_action :set_task_header
  before_action :set_task_detail, only: [:show, :update, :destroy]

  def index
    @task_details = @task_header.task_details
    render json: @task_details
  end

  def show
    render json: @task_detail
  end

  def create
    @task_detail = @task_header.task_details.build(task_detail_params)
    if @task_detail.save
      render json: @task_detail, status: :created
    else
      render json: @task_detail.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task_detail.update(task_detail_params)
      render json: @task_detail
    else
      render json: @task_detail.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task_detail.destroy
    head :no_content
  end

  private

  def set_task_header
    @task_header = current_user.task_headers.find(params[:task_header_id])
  end

  def set_task_detail
    @task_detail = @task_header.task_details.find(params[:id])
  end

  def task_detail_params
    params.require(:task_detail).permit(:name, :notes, :due_date, :completed)
  end

end
