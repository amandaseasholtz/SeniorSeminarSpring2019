class paymentManagersController < ApplicationController
    before_action :set_paymentManager, only: [:edit, :update]
  
    def edit
    end
  

    def update
      respond_to do |format|
        if @paymentManger.update(paymentManager_params)
          format.html { redirect_to store_index_url, notice: "The profile of the Payment Manager #{@paymentManager.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @paymentManager.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_paymentManager
        @paymentManager = paymentManager.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def paymentManager_params
        params.require(:paymentManager).permit(:name, :idNum, :department, :title)
      end
  end