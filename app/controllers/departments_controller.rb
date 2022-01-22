class DepartmentsController < ApplicationController
    before_action :set_department, only: [:show, :destroy, :edit, :update]

    def index
        @departments = Department.all.page(params[:page])
    end

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(strong_params)

        if @department.save
            redirect_to departments_url, flash: { success: t('departments.alerts.department_saved')}
        else
            flash[:danger] = t('departments.alerts.department_not_saved')
            render :new
        end
    end

    def update
        if @department.update(strong_params)
            redirect_to department_url(@department), flash: { success: t('departments.alerts.department_updated')}
        else
            flash[:danger] = t('departments.alerts.department_not_updated')
            render :edit
        end
    end

    def destroy
        @department.destroy
        redirect_to departments_url
    end

    private

    def strong_params
        params.require(:department).permit(:name, :code)
    end

    def set_department
        @department = Department.find(params[:id])
    end
end