class DashboardController < ApplicationController
  before_action :require_user

  def index
    today = Date.today
    month = today.month
    year = today.year

    @transactions_total = Transaction.total(false).round(2)
    @transactions_this_month = Transaction.by_date(today.beginning_of_month, today.end_of_month, false)

    if params.has_key?(:month) && params.has_key?(:year)
      month = params[:month].to_i
      year = params[:year].to_i
    end

    @date_from = Date.new(year, month, 1)
    date_to = @date_from.at_end_of_month
    @trans = Transaction.joins(:category).where(:is_income => false, :date => @date_from .. date_to).group('categories.name').sum(:amount)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trans.map{|t| {category: t[0], amount: t[1]} }.to_a }
    end
  end

  def pie_chart
    month = Date.today.month
    year = Date.today.year

    if params.has_key?(:month) && params.has_key?(:year)
      month = params[:month].to_i
      year = params[:year].to_i
    end

    @date_from = Date.new(year, month, 1)
    date_to = @date_from.at_end_of_month

    @trans = Transaction.by_category_and_date(@date_from, date_to, false)
    render json: {
        :type => 'PieChart',
        :cols => [['Expenses', 'Amount']],
        :rows => @trans.to_a,
        :options => {
            :chartArea => { :width => '90%', :height => '75%' },
            :hAxis => { :showTextEvery => 30 },
            :legend => 'bottom',
        }}
  end

  def total_transactions
    is_income = params[:is_income]
    #t = Transaction.select("date_part('year', date) as date, sum(amount) as amount").group("date_part('year', date), is_income").order("date")
    @trans = Transaction.where(:is_income => is_income).group("date_trunc('year', date)").sum("amount")
    render json: @trans.to_a
  end

end
