class ChangeValuesController < ApplicationController
  before_action :set_change_value, only: [:edit, :update, :destroy, :show]

  def index
    @changes = Change.order(created_at: :asc)
    @change_values = ChangeValue.order(year_month: :asc)
  end

  def show
  end

  def new
    year_month_day = params[:year_month] + "-01"
    @year_month = year_month_day.to_date

    @changes = Change.order(created_at: :asc)
    @form = Form::ChangeForm.new
  end

  def edit
    @change = Change.find(@change_value.change_id)
  end

  def create
    @form = Form::ChangeForm.new(change_form_params)
    if @form.save
      redirect_to change_values_path
    else
      render :new
    end
  end

  def update
    if @change_value.update(change_value_params)
      redirect_to change_values_path
    else
      render :edit
    end
  end

  def destroy
    @change_value.destroy
    redirect_to change_values_path
  end

 private

  def set_change_value
    @change_value = ChangeValue.find(params[:id])
  end

  def change_form_params
    params
    .require(:form_change_form)
    .permit(change_values_attributes: Form::ChangeValues::REGISTRABLE_ATTRIBUTES)
  end

  def change_value_params
    params
    .require(:change_value)
    .permit(:change_id, :year_month, :value, :description)
  end

end

