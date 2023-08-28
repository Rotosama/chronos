class TimeEntriesController < ApplicationController
  before_action :set_worker

  def index
    @time_entries = TimeEntry.where(worker_id: @worker.id)
  end

  def show
    @time_entry = TimeEntry.where(worker_id: @worker.id, id: @time_entry.id)
  end

  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.worker_id = @worker.id
    if @time_entry.save
      redirect_to worker_time_entries_path(@worker, @time_entry)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def time_entries_params
    params.require(:time_entry).permit(:worker_id, :entry_date, :exit_date)
  end

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end
end
