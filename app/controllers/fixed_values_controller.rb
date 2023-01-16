class FixedValuesController < ApplicationController
  before_action :set_fixed_value, only: [:edit, :update, :destroy, :show]

  def index
    @fixeds = Fixed.order(created_at: :asc)
    @fixed_values = FixedValue.order(year_month: :asc)
  end

  def show
  end

  def new
    year_month_day = params[:year_month] + "-01"
    @year_month = year_month_day.to_date

    @fixeds = Fixed.order(created_at: :asc)
    @form = Form::FixedForm.new
  end

  def edit
    @fixed = Fixed.find(@fixed_value.fixed_id)
  end

  def create
    @form = Form::FixedForm.new(fixed_form_params)
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @fixed_value.update(fixed_value_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @fixed_value.destroy
    redirect_to root_path
  end

 private

  def set_fixed_value
    @fixed_value = FixedValue.find(params[:id])
  end

  def fixed_form_params
    params
    .require(:form_fixed_form)
    .permit(fixed_values_attributes: Form::FixedValues::REGISTRABLE_ATTRIBUTES)
  end

  def fixed_value_params
    params
    .require(:fixed_value)
    .permit(:fixed_id, :year_month, :value, :description)
  end
end
