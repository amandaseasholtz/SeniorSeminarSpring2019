
class RequestsController < ApplicationController
    def index   
    end  
  
    # GET /orders/1
    # GET /orders/1.json
    def show
      @requestTotal = 0
      authorize @request  
    end
  
    # GET /orders/new
    def new
      @request = Request.new
      authorize @request
      if current_account && current_account.accountable_type == "Employee"
          @request.name     = current_account.accountable.name
          @request.email  = current_account.email
      end
      respond_to do |format|
        format.html
      end
    end
  
    # GET /orders/1/edit
    def edit
      authorize @request
    end
  
    # POST /orders
    # POST /orders.json
    def create
      @request = Request.new(order_params)
      authorize @request
      if current_account && current_account.accountable_type == "Employee"
        @request.employee = current_account.accountable
      end
      respond_to do |format|
        if @request.save
          format.html { redirect_to homepage_index_url, notice: 'Travel request was made.' }
          format.json { render :show, status: :created, location: @request }
        else
          format.html { render :new }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /orders/1
    # PATCH/PUT /orders/1.json
    def update
      authorize @request
      respond_to do |format|
        if @request.update(order_params)
          format.html { redirect_to @request, notice: 'Request was successfully updated.' }
          format.json { render :show, status: :ok, location: @request }
        else
          format.html { render :edit }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /orders/1
    # DELETE /orders/1.json
    def destroy
      authorize @request
      @request.destroy
      respond_to do |format|
        format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_request
        @request = Request.find(params[:id])
      end
  
  end
  