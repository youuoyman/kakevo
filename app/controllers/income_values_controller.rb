class IncomeValuesController < ApplicationController
  before_action :set_income_value, only: [:edit, :update, :destroy, :show]

  def index
    @incomes = Income.order(created_at: :asc)
    @income_values = IncomeValue.order(year_month: :asc)
  end

  def show
  end

  def new
    year_month_day = params[:year_month] + "-01"
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
      redirect_to income_values_path
    else
      render :new
    end
  end

  def update
    if @income_value.update(income_value_params)
      redirect_to income_values_path
    else
      render :edit
    end
  end

  def destroy
    @income_value.destroy
    redirect_to income_values_path
  end

 private

  def set_income_value
    @income_value = IncomeValue.find(params[:id])
  end

  def income_form_params
    params
    .require(:form_income_form)
    .permit(income_values_attributes: Form::IncomeValues::REGISTRABLE_ATTRIBUTES)
  end

  def income_value_params
    params
    .require(:income_value)
    .permit(:income_id, :year_month, :value, :description)
  end

end

