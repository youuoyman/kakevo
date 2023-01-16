class IncomeValuesController < ApplicationController
  before_action :set_income_value, only: [:edit, :update, :destroy]

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

  def edit
    @income = Income.find(@income_value.income_id)
  end

  def create
    @form = Form::IncomeForm.new(income_form_params)
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @income_value.update(income_form_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @income_value.destroy
    redirect_to root_path
  end

  private

  def set_income_value
    @income_value = IncomeValue.find(params[:id])
  end

  def income_form_params
    params.require(:form_income_form).premit(income_value_attributes: Form::IncomeValue::REGISTRABLE_ATTRIBUTES)
  end
end

