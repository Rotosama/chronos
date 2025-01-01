class BreaksController < ApplicationController
  before_action :set_worker, :set_time_entry
  before_action :require_admin, only: [:edit, :update, :delete]
  
  def index
    @breaks = Break.where(time_entry_id: @time_entry.id)
  end
  
  def show
    @break = Break.where(time_entry_id: @time_entry.id)
    end

  def new
    @break = Break.new
  
  end

  def create
    @break = Break.new(break_params)
    @break.time_entry_id = @time_entry.id
    @break.start_time = Time.zone.now.change(day: @time_entry.entry_date.day)
    if @break.save
      flash[:notice] = "Se creó una nueva pausa."
      redirect_to worker_time_entry_path(@worker, @time_entry)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def stop_pause
    @break = @time_entry.breaks.find(params[:id])
    @break.end_time = Time.zone.now.change(day: @time_entry.entry_date.day)
    if @break.save
      flash[:notice] = "Ha reanudado la jornada."
      redirect_to worker_time_entry_path(@worker, @time_entry)
    else
      flash[:alert] = "No se pudo reanudar la jornada."
    end
  end

  def edit
    @break = @time_entry.breaks.find(params[:id])
  end

  def update
    @break = @time_entry.breaks.find(params[:id])
    if @break.update(break_params)
      flash[:notice] = "Sus cambios han sido guardados."

      redirect_to worker_time_entries_path()
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @break = Break.find(params[:id])
    @break.destroy
    flash[:notice] = "Se eliminó la pausa correctamente."

    redirect_to worker_time_entry_breaks_path
  end

  private

  def break_params
    params.require(:break)
          .permit(:time_entry_id, :start_time, :end_time, :comment)
  end

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end

  def set_time_entry
    @time_entry = TimeEntry.find(params[:time_entry_id])
  end

  def require_admin
    unless current_worker.admin?
      flash[:alert] = "Sólo el administrador puede editar las pausas."
      redirect_to worker_time_entry_breaks_path
    end
  end
end
