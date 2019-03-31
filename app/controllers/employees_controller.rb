class EmployeesController < ApplicationController
    before_action :set_employee, only: [:edit, :update]
  

    def edit
    end

    def update
      respond_to do |format|
        if @employee.update(employee_params)
          format.html { redirect_to homepage_index_url, notice: "The profile of the Employee #{@employee.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_employee
        @employee = Employee.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def employee_params
        params.require(:employee).permit(:name, :eid, :department, :title)
      end
  end