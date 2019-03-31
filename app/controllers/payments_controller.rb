class PaymentsController < ApplicationController
    before_action :set_payment, only: [:edit, :update]
  

    def edit
    end

    def update
      respond_to do |format|
        if @payment.update(payment_params)
          format.html { redirect_to homepage_index_url, notice: "The profile of the Payment Manager #{@payment.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_payment
        @payment = Payment.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def payment_params
        params.require(:payment).permit(:name, :pid, :department, :title)
      end
  end