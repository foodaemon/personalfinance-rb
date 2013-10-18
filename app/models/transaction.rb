class Transaction < ActiveRecord::Base
  belongs_to :category, :foreign_key => :category_id
  #attr_accessible :amount, :category_id, :comments, :date, :description, :is_income

  validates :date, :presence => true
  validates :description, :presence => true, :length => {:minimum => 2, :maximum => 50}
  validates :amount, :presence => true, :numericality => true

  # transaction by date range
  def self.by_date(date_from, date_to, is_income = nil)
    trans = Transaction.includes(:category).where(:date => date_from .. date_to).order(:date, :description)
    if !is_income.nil?
      trans = trans.where(:is_income => is_income)
    end
    trans.reverse_order
    #Transaction.includes(:category).where(:is_income => is_income, :date => date_from .. date_to).order(:date, :description).reverse_order
  end

  # transaction by date range grouped by category
  def self.by_category_and_date(date_from, date_to, is_income = false)
    Transaction.joins(:category).where(:is_income => is_income, :date => date_from .. date_to).group('categories.name').sum(:amount)
  end

  # get by distinct
  def self.by_distinct_description
    Transaction.select(:description).uniq
  end

  # transaction by year
  def self.by_year(year, is_income = false)
    if year.nil?
      year = Date.today.year
    end
    date = Date.new(year, 1, 1)
    Transaction.where(:is_income => is_income, :date => date.beginning_of_year .. date.end_of_year).sum(:amount)
  end

  # total transaction
  def self.total(is_income = false)
    Transaction.where(:is_income => is_income).sum(:amount)
  end

  def self.grouped_by_year
    Transaction.select("date_part('year', date) as date, sum(amount) as amount, is_income").group("date_part('year', date), is_income").order("date")
  end

end
