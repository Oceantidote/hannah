class BatchDaysController < ApplicationController
  before_action :set_batch_day, only: [:show, :edit, :update, :destroy]

  # GET /batch_days
  # GET /batch_days.json
  def index
    @batch_days = BatchDay.all
  end

  # GET /batch_days/1
  # GET /batch_days/1.json
  def show
  end

  # GET /batch_days/new
  def new
    @batch = Batch.find(params[:batch_id])
    @batch_day = BatchDay.new
  end

  # GET /batch_days/1/edit
  def edit
  end

  # POST /batch_days
  # POST /batch_days.json
  def create
    @batch_day = BatchDay.new(batch_day_params)
    @batch = Batch.find(params[:batch_id])
    @batch_day.batch = @batch

    if @batch_day.save
      redirect_to batch_path(@batch)
    else
      render :new
    end
  end

  # PATCH/PUT /batch_days/1
  # PATCH/PUT /batch_days/1.json
  def update
    respond_to do |format|
      if @batch_day.update(batch_day_params)
        format.html { redirect_to @batch_day, notice: 'Batch day was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch_day }
      else
        format.html { render :edit }
        format.json { render json: @batch_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_days/1
  # DELETE /batch_days/1.json
  def destroy
    @batch_day.destroy
    respond_to do |format|
      format.html { redirect_to batch_days_url, notice: 'Batch day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_day
      @batch_day = BatchDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_day_params
      params.require(:batch_day).permit(:batch_id, :title)
    end
end
