class BatchMembershipsController < ApplicationController
  before_action :set_batch_membership, only: [:show, :edit, :update, :destroy]

  # GET /batch_memberships
  # GET /batch_memberships.json
  def index
    @batch_memberships = BatchMembership.all
  end

  # GET /batch_memberships/1
  # GET /batch_memberships/1.json
  def show
  end

  # GET /batch_memberships/new
  def new
    @batch = Batch.find(params[:batch_id])
    @batch_membership = BatchMembership.new
  end

  # GET /batch_memberships/1/edit
  def edit
  end

  # POST /batch_memberships
  # POST /batch_memberships.json
  def create
    @batch = Batch.find(params[:batch_id])
    @new_user = User.new(email: batch_membership_params[:email], password: "random")
    @batch_membership = BatchMembership.new(batch_membership_params)
    @batch_membership.user = @new_user
    @batch_membership.batch = @batch
    if @new_user.save && @batch_membership.save
      redirect_to batch_path(@batch)
    else
      raise
      render :new
    end
  end

  # PATCH/PUT /batch_memberships/1
  # PATCH/PUT /batch_memberships/1.json
  def update
    respond_to do |format|
      if @batch_membership.update(batch_membership_params)
        format.html { redirect_to @batch_membership, notice: 'Batch membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch_membership }
      else
        format.html { render :edit }
        format.json { render json: @batch_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_memberships/1
  # DELETE /batch_memberships/1.json
  def destroy
    @batch_membership.destroy
    respond_to do |format|
      format.html { redirect_to batch_memberships_url, notice: 'Batch membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_membership
      @batch_membership = BatchMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_membership_params
      params.require(:batch_membership).permit(:batch_id, :user_id, :email)
    end
end
