class BreaksController < ApplicationController
  def index
    @breaks = Break.all
  end

  def show
    @break = Break.find(params[:id])
  end

  def new
    @break = Break.new
  end

  def create
    @break = Break.new(break_params)
    if @break.save
      redirect_to @break
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @break = Break.find(params[:id])
  end

  def update
    @break = Break.find(params[:id])
    if @break.update(break_params)
      redirect_to break_path(@break)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @break = Break.find(params[:id])
    @break.destroy
    redirect_to break_path
  end

  private

  def break_params
    params.require(:break)
          .permit(:start_time, :end_time, :comment)
  end
end
