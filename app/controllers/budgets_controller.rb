class BudgetsController < ApplicationController
    before_action :set_budget, only: [:edit, :update]
  

    def edit
    end

    def update
      respond_to do |format|
        if @budget.update(budget_params)
          format.html { redirect_to homepage_index_url, notice: "The profile of the Budget Advisors #{@budget.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @budget.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_budget
        @budget = Budget.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def budget_params
        params.require(:budget).permit(:name, :bid, :department, :title, :dmoney)
      end
  end