module DashboardHelper
  def chart_tag (action, height, params = {})
    params[:format] ||= :json
    path = dashboard_path(action, params)
    content_tag(:div, :'data-chart' => path, :style => "height: #{height}px;") do
      image_tag('spinner.gif', :size => '24x24', :class => 'spinner')
    end
  end

  def expenses_this_year
    Transaction.by_year(Date.today.year, false).round(2)
  end

  def expenses_this_month
    today = Date.today
    transaction = Transaction.by_date(today.beginning_of_month, today.end_of_month, false)
    transaction.sum(&:amount).round(2)
    #transaction.sum{|t| t.amount}
  end

  def total_expenses
    Transaction.total(false).round(2)
  end

  def total_income
    Transaction.total(true).round(2)
  end

  def income_this_month
    today = Date.today
    transaction = Transaction.by_date(today.beginning_of_month, today.end_of_month, true)
    transaction.sum(&:amount).round(2)
    #transaction.sum{|t| t.amount}.round(2)
  end

  def income_this_year
    Transaction.by_year(Date.today.year, true).round(2)
  end

  def all_categories
    Category.all
  end
end
