class TimeEntriesController < ApplicationController
  before_action :set_worker

  def index
    @time_entry = TimeEntry.where(worker_id: @worker.id)
  end

  def show
    @time_entry  = TimeEntry
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end
end
