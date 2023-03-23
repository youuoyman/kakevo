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

  def show_year
    year = params[:year]
    @year = year
    months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    year_months = months.map do |month|
      year+ "-"+ month +"-01"
    end

    puts year_months

    #年度の収入配列を作成
    i=0
    total = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    year_months.each do |year_month|
      income_values = IncomeValue.where(year_month: year_month)
      if income_values.present?
        total[i] = cal_income_total(income_values)
      end
      i += 1
    end
    @income_value_totals = total

    #年度の固定費配列を作成
    i = 0
    total = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    year_months.each do |year_month|
      fixed_values = FixedValue.where(year_month: year_month)
      if fixed_values.present?
        total[i] = cal_fixed_total(fixed_values)
      end
      i+=1
    end
    @fixed_value_totals = total

    #年度の変動費配列を作成
    i = 0
    total = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    year_months.each do |year_month|
      change_values = ChangeValue.where(year_month: year_month)
      if change_values.present?
      total[i] = cal_change_total(change_values)
      end
      i+=1
    end
    @change_value_totals = total

    #年度の収支結果を計算
    @balance_differences = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    0.upto(11) do |i|
      if @income_value_totals[i].present?
        @balance_differences[i] = @income_value_totals[i] - (@fixed_value_totals[i]+ @change_value_totals[i])
      end
    end
  end
  
  #収入トータル計算
  def cal_income_total(income_values)
    income_value_total = 0
    income_values.each do |income_value|
      income_value_total += income_value.value
    end
    income_value_total
  end

  #固定費トータル計算
  def cal_fixed_total(fixed_values)
    fixed_value_total = 0
    fixed_values.each do |fixed_value|
      fixed_value_total += fixed_value.value
    end
    fixed_value_total
  end

  #変動費トータル計算
  def cal_change_total(change_values)
    change_value_total = 0
    change_values.each do |change_value|
      change_value_total += change_value.value
    end
    change_value_total
  end
end
