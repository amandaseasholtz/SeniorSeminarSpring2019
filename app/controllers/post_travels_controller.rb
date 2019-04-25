class PostTravelsController < ApplicationController
  before_action :set_post_travel, only: [:show, :edit, :update, :destroy]

  # GET /post_travels
  # GET /post_travels.json
  def index
    @post_travels = PostTravel.all
      respond_to do |format|
        format.html {
            if (params[:spa] && params[:spa] == "true")
                render 'index_spa'
            # the else case below is by default
            else
               render 'index'
            end
        }
      end
  end

  # GET /post_travels/1
  # GET /post_travels/1.json
  def show
  end

  # GET /post_travels/new
  def new
    @post_travel = PostTravel.new

    if (params[:spa] && params[:spa] == "true")
      render 'index_spa'
    end
    
  end

  # GET /post_travels/1/edit
  def edit
  end

  # POST /post_travels
  # POST /post_travels.json
  def create
    @post_travel = PostTravel.new(post_travel_params)

    respond_to do |format|
      if @post_travel.save
        format.html { redirect_to @post_travel, notice: 'Post travel was successfully created.' }
        format.json { render :show, status: :created, location: @post_travel }
      else
        format.html { render :new }
        format.json { render json: @post_travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_travels/1
  # PATCH/PUT /post_travels/1.json
  def update
    respond_to do |format|
      if @post_travel.update(post_travel_params)
        format.html { redirect_to @post_travel, notice: 'Post travel was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_travel }
      else
        format.html { render :edit }
        format.json { render json: @post_travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_travels/1
  # DELETE /post_travels/1.json
  def destroy
    @post_travel.destroy
    respond_to do |format|
      format.html { redirect_to post_travels_url, notice: 'Post travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_travel
      @post_travel = PostTravel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_travel_params
      params.require(:post_travel).permit(:name, :destination, :start_date, :end_date, :purpose, :expected_expenses, :actual_expenses, :payment_infomation, :receipts_url)
    end
end
