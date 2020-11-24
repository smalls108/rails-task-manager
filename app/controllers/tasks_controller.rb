class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to root_path
  end
  # <Task id: nil, title: nil, details: nil, completed: false, created_at: nil, updated_at: nil>

  # <Task id: 2, title: "Studying", details: "A lot of flashcards to do", completed: true, created_at: "2020-11-24 04:34:13", updated_at: "2020-11-24 04:34:13">

  def destroy
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
