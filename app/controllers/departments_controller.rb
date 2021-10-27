class DepartmentsController < ApplicationController
    before_action :set_department, only: [:show, :destroy, :edit, :update]

    def index
        @departments = Department.all
    end

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(strong_params)

        if @department.save
            redirect_to departments_url, flash: { success: 'Department saved...'}
        else
            flash[:danger] = 'Department not saved...'
            render :new
        end
    end

    def update
        if @department.update(strong_params)
            redirect_to department_url(@department), flash: { success: 'Department updated...'}
        else
            flash[:danger] = 'Department not updated...'
            render :edit
        end
    end

    def destroy
        @department.destroy
        redirect_to departments_url
    end

    private

    def strong_params
        params.require(:department).permit(:name)
    end

    def set_department
        @department = Department.find(params[:id])
    end
end