class budgetApproversController < ApplicationController
    before_action :set_budgetApprover, only: [:edit, :update]
  
    def edit
    end
  

    def update
      respond_to do |format|
        if @budgetApprover.update(budgetApprover_params)
          format.html { redirect_to store_index_url, notice: "The profile of the Budget Approver #{@budgetApprover.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @budgetApprover.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_budgetApprover
        @budgetApprover = BudgetApprover.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def budgetApprover_params
        params.require(:budgetApprover).permit(:name, :idNum, :department, :title)
      end
  end