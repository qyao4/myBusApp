class StopsController < ApplicationController
  def index
    @stops = Stop.all.order(:key).page(params[:page]).per(5)
    if params[:key].present?
      @stops = @stops.where("key LIKE ?", "%#{params[:key]}%")
    end
    if params[:name].present?
      @stops = @stops.where("name LIKE ?", "%#{params[:name]}%")
    end
  end

  def show
    @stop = Stop.includes(schedules: :route).find(params[:id])
  end
end
