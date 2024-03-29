class RoutesController < ApplicationController
  def index
    # @routes = Route.all
    @routes = Route.all.order(:number).page(params[:page]).per(5)
    if params[:search].present?
      @routes = @routes.where("number LIKE ?", "%#{params[:search]}%")
    end
    if params[:coverage].present?
      @routes = @routes.where(coverage: params[:coverage])
    end
  end

  def show
    @route = Route.find(params[:id])
    @stops = @route.unique_stops
  end
end
