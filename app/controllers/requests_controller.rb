class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json

  def index

    @requests = Request.all 





  respond_to do |format|
    format.html {
        if (params[:spa] && params[:spa] == "true")
            render 'index_spa'
        # the else case below is by default
        else
           render 'index'
        end
    }
    #format.json {render json: @products}
  end
end


  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
    @expects = @request.expects
  end

  # GET /requests/new
  def new
    @request = Request.new


    

    if (params[:spa] && params[:spa] == "true")
      render 'index_spa'
    end

  end

  # GET /requests/1/edit
  def edit

    @expects = @request.expects
  end

  # POST /requests
  # POST /requests.json
  def create

    @request = Request.new(request_params)
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
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

    # Never trust parameters from the scary internet, only allow the white list through.


    def request_params

      params.require(:request).permit(:name, :destination, :start_date, :end_date, :purpose,
        :expected_expenses,:expected_expenses2,:expected_expenses3, :payment_information,:payment_information2,:payment_information3, :employee_id, 
        :status, :reasoning, :budget_name,:budget_name2,:budget_name3, :expected_costs,:expected_costs2,:expected_costs3,:field_num, :total_costs)


    end
end
