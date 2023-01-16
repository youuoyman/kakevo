class IncomeValuesController < ApplicationController
  def index
    @incomes = Income.order(created_at: :asc)
    @income_value = IncomeValue.order("year_month asc")
  end
end
