class TaskHeadersController < ApplicationController
  before_action :authenticate_user!

  def index
    @task_headers = current_user.task_headers
    render json: @task_headers
  end

  def show
    @task_header = current_user.task_headers.find(params[:id])
  end

  def create
    @task_header = current_user.task_headers.build(task_header_params)
    if @task_header.save
      render json: @task_header, status: :created
    else
      render json: @task_header.errors, status: :unprocessable_entity
    end
  end

  def update
    @task_header = current_user.task_headers.find(task_header_params)
    if @task_header.update(task_header_params)
      render json: @task_header
    else
      render json: @task_header.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task_header = current_user.task_headers.find(params[:id])
    @task_header.destroy
    head :no_content
  end

  private

  def task_header_params
    params.require(:task_header).permit(:title)
  end

end
