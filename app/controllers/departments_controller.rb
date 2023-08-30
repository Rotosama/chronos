class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = "El departamento ha sido creado correctamente."
      redirect_to departments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      flash[:notice] = "El departamento se ha modificado correctamente."
      redirect_to departments_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:notice] = "El departamento se ha eliminado correctamente."
    redirect_to departments_path
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
