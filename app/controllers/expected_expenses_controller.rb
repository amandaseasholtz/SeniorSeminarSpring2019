class ExpectedExpensesController < ApplicationController

  
    # GET /requests
    # GET /requests.json
  
  
    def index
        
        @expense = Request.all


       
          #format.json {render json: @products}
    end
    
    # GET /requests/1
    # GET /requests/1.json
    def show
    end
  
    # GET /requests/new
    def new

    end
  
    # GET /requests/1/edit
    def edit

    end
  
    # POST /requests
    # POST /requests.json
    def create
        
      @expense = ExpectedExpense.new(request_params)
      @expense.save


      respond_to do |format|
        if @expense.save
          format.html { redirect_to @expense, notice: 'Request was successfully created.' }
          format.json { render template: "requests/show", status: :created, location: @expense}
        else
          format.html { render :new }
          format.json { render json: @expense.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /requests/1
    # PATCH/PUT /requests/1.json
    def update

    end
  
    # DELETE /requests/1
    # DELETE /requests/1.json
    def destroy

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_request

      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
  
  
      def request_params
  
        params.permit( :request_id, :expense, :expected_expense)

      end
    
    end