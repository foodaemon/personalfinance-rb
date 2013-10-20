class TransactionsController < ApplicationController
  before_filter :require_user
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions/description
  def description
    @descriptions = Transaction.by_distinct_description
  end

  # GET /transactions
  # GET /transactions.json
  def index
    @month = Date.today.month
    @year = Date.today.year

    if params.has_key?(:month) && params.has_key?(:year)
      @month = params[:month].to_i
      @year = params[:year].to_i
    end

    @date_from = Date.new(@year, @month, 1)
    date_to = @date_from.at_end_of_month
    @transactions = Transaction.by_date(@date_from, date_to, nil)
    @total_expenses = @transactions.where(:is_income => false).sum(& :amount).round(2)
    @total_income = @transactions.where(:is_income => true).sum(& :amount).round(2)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  def merchant
    search_param = params[:search]
    merchants = Transaction.where('lower(description) LIKE ?', "%#{search_param.downcase}%").pluck(:description).uniq
    render json: merchants.as_json(only: [:description])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :category_id, :comments, :date, :description, :is_income)
    end
end