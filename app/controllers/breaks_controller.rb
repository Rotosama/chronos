class BreaksController < ApplicationController
  before_action :set_worker, :set_time_entry
  
  def index
    @breaks = Break.where(time_entry_id: @time_entry.id)
  end
  
  def show
    @break = Break.where(time_entry_id: @time_entry.id)
    end

  def new
    @break = Break.new
    @break.start_time = Time.zone.now.beginning_of_day
    @break.end_time = Time.zone.now.beginning_of_day
  end

  def create
    @break = Break.new(break_params)
    @break.time_entry_id = @time_entry.id
    @break.start_time = @break.start_time.change(day: @time_entry.entry_date.day)
    @break.end_time = @break.end_time.change(day: @time_entry.entry_date.day)
    if @break.save
      redirect_to worker_time_entries_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @break = @time_entry.breaks.find(params[:id])
  end

  def update
    @break = @time_entry.breaks.find(params[:id])
    if @break.update(break_params)
      redirect_to worker_time_entries_path()
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @break = Break.find(params[:id])
    @break.destroy
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
end
