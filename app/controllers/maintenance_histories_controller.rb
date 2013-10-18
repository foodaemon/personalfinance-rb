class MaintenanceHistoriesController < ApplicationController
  before_filter :require_user
  before_action :set_maintenance_history, only: [:show, :edit, :update, :destroy]

  # GET /maintenance_histories
  # GET /maintenance_histories.json
  def index
    @maintenance_histories = MaintenanceHistory.includes(:vehicle).order(:maintenance_date)
  end

  # GET /maintenance_histories/1
  # GET /maintenance_histories/1.json
  def show
  end

  # GET /maintenance_histories/new
  def new
    @maintenance_history = MaintenanceHistory.new
    @vehicles = Vehicle.new
  end

  # GET /maintenance_histories/1/edit
  def edit
  end

  # POST /maintenance_histories
  # POST /maintenance_histories.json
  def create
    @maintenance_history = MaintenanceHistory.new(maintenance_history_params)

    respond_to do |format|
      if @maintenance_history.save
        format.html { redirect_to @maintenance_history, notice: 'Maintenance history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @maintenance_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @maintenance_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_histories/1
  # PATCH/PUT /maintenance_histories/1.json
  def update
    respond_to do |format|
      if @maintenance_history.update(maintenance_history_params)
        format.html { redirect_to @maintenance_history, notice: 'Maintenance history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @maintenance_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_histories/1
  # DELETE /maintenance_histories/1.json
  def destroy
    @maintenance_history.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_history
      @maintenance_history = MaintenanceHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_history_params
      params.require(:maintenance_history).permit(:item, :item_description, :maintenance_cost, :maintenance_date, :mileage,
                                                  :repair_shop, :repair_shop_location, :repair_shop_phone, :vehicle_id)
    end
end
