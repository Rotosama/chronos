class TimeEntriesController < ApplicationController
  before_action :set_worker
  before_action :require_same_worker

  def index
    @time_entries = TimeEntry.where(worker_id: @worker.id)
  end

  def show
    @time_entry = @worker.time_entries.find(params[:id])
    
  end

  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new(time_entries_params)
    @time_entry.worker_id = @worker.id
    @time_entry.entry_date = DateTime.now
    if @time_entry.save
      flash[:notice] = "Ha iniciado la jornada."
      redirect_to worker_time_entry_path(@worker, @time_entry)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def close_day
    @time_entry = @worker.time_entries.find(params[:id])
    @time_entry.worker_id = @worker.id
    @time_entry.exit_date = DateTime.now
    if @time_entry.save
      flash[:notice] = "Ha acabado la jornada."
      redirect_to worker_time_entries_path(@worker)
    else
      flash[:alert] = "No se pudo cerrar la jornada."
    end
  end

  def edit
    @time_entry = @worker.time_entries.find(params[:id]) 
  end

  def update
    @time_entry = @worker.time_entries.find(params[:id]) 
    if @time_entry.update(time_entries_params)
      flash[:notice] = "Sus cambios han sido guardados."
      redirect_to worker_time_entries_path(@worker)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @time_entry = @worker.time_entries.find(params[:id]) 
    @time_entry.destroy
    flash[:notice] = "Se eliminó la entrada de tiempo correctamente."
    redirect_to worker_time_entries_path(@worker)
  end
  

  private

  def time_entries_params
    params.require(:time_entry).permit(:worker_id, :entry_date, :exit_date)
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
