class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # recup la tache en question affichée (avec id)
    # Task.find(params[:id])
    # la ranger dans une variable (@task)
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # params[:task])
    # -> je recupere ce que j'ai soumis de mon form
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private
  # error forbidden -> n'a pas accès aux params
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
