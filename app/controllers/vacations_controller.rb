class VacationsController < ApplicationController
  before_action :set_worker
  before_action :require_same_worker

  def index
    @vacations = Vacation.all
  end
  
  def edit
    @vacation = Vacation.find(params[:id])
  end

  def update
    @vacation = Vacation.find(params[:id])
    if @vacation.update(vacation_params)
      flash[:notice] = "Sus cambios han sido guardados."
      redirect_to worker_vacations_path(@worker)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @vacation = Vacation.new
  end

  def create
    @vacation = Vacation.new(vacation_params)
    @vacation.worker_id = @worker.id
    @vacation.status = "Pendiente"
    if @vacation.save
      flash[:notice] = "Sus vacaciones se han registrado correctamente"
      redirect_to worker_vacations_path(@worker)
    else
      flash.now[:alert] = "No se pudo registrar sus vacaciones."
      render :new, status: :unprocessable_entity
    end
    
  end

  def destroy
    @vacation = Vacation.find(params[:id])
    @vacation.destroy
    flash[:notice] = "Se eliminaron las vacaciones correctamente."
    redirect_to worker_vacations_path(@worker)
  end

  private

  def vacation_params
    params.require(:vacation).permit(:worker_id, :start_time, :end_time, :status, :description)
  end

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end

  def require_same_worker
    unless current_worker && (current_worker == @worker || current_worker.admin?)
      flash[:alert] = "Sólo puedes editar tus propios recursos"
      redirect_to worker_path(current_worker)
    end
  end
end
