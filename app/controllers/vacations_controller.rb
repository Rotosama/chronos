class VacationsController < ApplicationController
  before_action :set_worker

  def index
    @vacations = Vacation.all
  end
  

  def edit
  end

  def update
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
      flash[:alert] = "No se pudo registrar sus vacaciones."
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
end
