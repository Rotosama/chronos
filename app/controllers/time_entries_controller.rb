class TimeEntriesController < ApplicationController
  def index
    @time_entry = TimeEntry.all
  end

  def show
    @time_entry  = TimeEntry.find(params[:id])
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
end