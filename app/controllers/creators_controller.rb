class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :update, :destroy]

  # GET /creators
  def index

      @creators = Creator.all
      @creators = @creators.order(params[:sort] + " " + params[:sort_direction]) if params[:sort] && params[:sort_direction]
      @creators = @creators.limit(params[:limit]) if params[:limit]
      @creators = @creators.offset(params[:offset]) if params[:offset]

      render json: @creators
  end

  # GET /creators/1
  def show
    render json: @creator
  end

  # POST /creators
  def create
    @creator = Creator.new(:first_name => params[:first_name], :last_name => params[:last_name])

    if @creator.save
      render json: @creator, status: :created, location: @creator
    else
      render json: @creator.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def creator_params
      params.require(:creator).permit(:first_name, :last_name)
    end
end
