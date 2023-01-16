class IncomeValuesController < ApplicationController
  def index
    @incomes = Income.order(created_at: :asc)
    @income_value = IncomeValue.order("year_month asc")
  end

  def new
    year_month_day = params[:year_month] + "-1"
    @year_month = year_month_day.to_date

    @incomes = Income.order(created_at: :asc)
    @form = Form::IncomeForm.new
  end
  
end
