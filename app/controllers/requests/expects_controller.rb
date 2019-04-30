class ExpectsController < ApplicationController
  before_action :set_expect, only: [:show, :edit, :update, :destroy]

  # GET /expects
  # GET /expects.json
  def index
    @expects = Expect.all
  end

  # GET /expects/1
  # GET /expects/1.json
  def show
  end

  # GET /expects/new
  def new
    @expect = Expect.new
  end

  # GET /expects/1/edit
  def edit
  end

  # POST /expects
  # POST /expects.json
  def create
    @expect = Expect.new(expect_params)

    respond_to do |format|
      if @expect.save
        format.html { redirect_to @expect, notice: 'Expect was successfully created.' }
        format.json { render :show, status: :created, location: @expect }
      else
        format.html { render :new }
        format.json { render json: @expect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expects/1
  # PATCH/PUT /expects/1.json
  def update
    respond_to do |format|
      if @expect.update(expect_params)
        format.html { redirect_to @expect, notice: 'Expect was successfully updated.' }
        format.json { render :show, status: :ok, location: @expect }
      else
        format.html { render :edit }
        format.json { render json: @expect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expects/1
  # DELETE /expects/1.json
  def destroy
    @expect.destroy
    respond_to do |format|
      format.html { redirect_to expects_url, notice: 'Expect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expect
      @expect = Expect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expect_params
      params.require(:expect).permit(:expected_expenses, :expected_costs, :payment_information, :request_id)
    end
end
