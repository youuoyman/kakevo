class FixedsController < ApplicationController
  before_action :set_fixed, only: [:show, :edit, :update, :destroy]

  def index
    @fixeds = Fixed.order(created_at: :asc)
	end
 
	def show
	end
 
	def new
    @fixed = Fixed.new()
	end
 
	def edit
	end
 
  def create
		@fixed = Fixed.new(fixed_params)
		if @fixed.save
			redirect_to fixeds_path
		else
			render :new
		end
	end

	def update
		if @fixed.update(fixed_params)
			redirect_to fixeds_path
		else
			render :new
		end
	end
 
  def destroy
		@fixed.destroy
		redirect_to fixeds_path
	end

  private

  def set_fixed
    @fixed = Fixed.find(params[:id])
  end

  def fixed_params
    params.require(:fixed).permit(:name, :description)
  end

end

