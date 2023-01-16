class ChangesController < ApplicationController
  before_action :set_change, only: [:show, :edit, :update, :destroy]

  def index
    @changes = Change.order(created_at: :asc)
	end
 
	def show
	end
 
	def new
    @change = Change.new()
	end
 
	def edit
	end
 
  def create
		@change = Change.new(change_params)
		if @change.save
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		if @change.update(change_params)
			redirect_to root_path
		else
			render :new
		end
	end
 
  def destroy
		@change.destroy
		redirect_to root_path
	end

  private

  def set_fixed
    @change = Change.find(params[:id])
  end

  def change_params
    params.require(:change).permit(:name, :description)
  end

end


end
