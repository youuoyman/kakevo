class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  
  def index
    @incomes = Income.order(created_at: :asc)
	end
 
	def show
	end
 
	def new
    @income = Income.new()
	end
 
	def edit
	end
 
  def create
		@income = Income.new(income_params)
		if @income.save
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		if @income.update(income_params)
			redirect_to root_path
		else
			render :new
		end
	end
 
  def destroy
		@income.destroy
		redirect_to root_path
	end

  private

  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:name, :description)
  end

end
