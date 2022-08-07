class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :update, :destroy]

  # GET /gigs
  def index
    @gigs = Gig.all

    render json: @gigs
  end

  # GET /gigs/1
  def show
    if( params[:show_relation] == "true" )
    render json: @gig.as_json.merge(:payment_state => @gig.gig_payment.state)
    else
      render json: @gig
    end
  end

  # POST /gigs
  def create

    @gig = Gig.new(gig_params)

    if @gig.save
      render json: @gig, status: :created, location: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end


  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      render json: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
  end

  def long_running_method
    puts 'Yoav'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig
      @gig = Gig.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gig_params
      params.permit(:brand_name, :state, :creator_id)
    end
end
