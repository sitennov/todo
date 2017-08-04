class TasksController < ApplicationController
  before_action :get_tasks, only: [:edit, :update, :complete, :destroy]

  def index
    @tasks = Task.where(completed: false).order('priority DESC')
    @completed_tasks = Task.where(completed: true).order('updated_at')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to tasks_path, notice: 'Task updated'
    else
      render :edit
    end
  end

  def complete
    if @task.complete!
      redirect_to tasks_path, notice: 'Task complete'
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: 'Task deleted'
    end
  end

  private

  def get_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit([
      :title,
      :priority,
      :completed
    ])
  end
end
