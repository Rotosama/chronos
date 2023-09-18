class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_action :require_same_worker, only: [:edit, :update, :destroy, :show]

  def index
    @workers = Worker.all
    @departments = Department.all
  end

  def show
    @time_entries = @worker.time_entries
    @department = Department.find(@worker.department_id).name
  end

  def new
    @worker = Worker.new
    @departments = Department.all

  end

  def create
    @departments = Department.all
    @worker = Worker.new(worker_params)
    if @worker.save
      flash[:notice] = "El perfil se ha creado correctamente."
      redirect_to @worker
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @departments = Department.all
  end

  def update
    if @worker.update(worker_params)
      unless current_worker.admin?
        bypass_sign_in @worker
      end
      flash[:notice] = "Tu perfil se ha modificado correctamente."
      redirect_to worker_path(@worker)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    
    @worker.destroy
    flash[:notice] = "El trabajador se ha eliminado correctamente."
    redirect_to workers_path
  end

  private

  def worker_params
    params.require(:worker).
    permit(:email, :password, :name, :last_name, :dni, :department_id, :birthdate, :admin)
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def require_same_worker
    unless current_worker && (current_worker == @worker || current_worker.admin?)
      flash[:alert] = "Sólo puedes editar tus propios recursos"
      redirect_to worker_path(current_worker)
    end
  end
end
