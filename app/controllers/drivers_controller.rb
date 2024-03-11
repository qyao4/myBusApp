class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:id).page(params[:page]).per(5)
    if params[:name].present?
      @drivers = @drivers.where("first_name LIKE ? or last_name Like ?", "%#{params[:name]}%", "%#{params[:name]}%")
    end
    if params[:email].present?
      @drivers = @drivers.where("email LIKE ?", "%#{params[:email]}%")
    end
  end

  def show
    @driver = Driver.find(params[:id])
  end
end
