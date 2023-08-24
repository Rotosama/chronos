class WorkersController < ApplicationController

  def index
    @workers = Worker.all
    @departments = Department.all
  end

  def show
    @worker  = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
    @departments = Department.all

  end

  def create
    @departments = Department.all
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to @worker
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @worker  = Worker.find(params[:id])

  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to worker_path(@worker)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    redirect_to worker_path
  end

  private

  def worker_params
    params.require(:worker).
    permit(:name, :last_name, :dni, :department_id, :birthdate, :start_date, :finish_date)
  end
end
