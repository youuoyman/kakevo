class BalanceController < ApplicationController
  def top
  end

  def show
    @year_month = params[:year_month] + "-1"
    @incomes = Income.order(created_at: :asc)
    @fixeds = Fixed.order(created_at: :asc)
    @changes = Change.order(created_at: :asc)

    #収入計算
    @income_values = IncomeValue.where(year_month: @year_month)
    @income_value_total = 0
    @income_values.each do |income_value|
      @income_value_total += income_value.value
    end

    #固定費計算
    @fixed_values = FixedValue.where(year_month: @year_month)
    @fixed_value_total = 0
    @fixed_values.each do |fixed_value|
      @fixed_value_total += fixed_value.value
    end
    
    #変動費計算
    @change_values = ChangeValue.where(year_month: @year_month)
    @change_value_total = 0
    @change_values.each do |change_value|
      @change_value_total += change_value.value
    end
    
    #収支差
    @balance_difference = @income_value_total - (@fixed_value_total + @change_value_total)

  end
end
