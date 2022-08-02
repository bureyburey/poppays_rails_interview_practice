class GigsController < ApplicationController
  def index
    @gigs = Gig.all

    render jsonapi: @gigs
  end

  def show
    @gig = Gig.find(params[:id])

    render jsonapi: @gig, include: params[:include]
  end

  def create
    param! :creator_id, Integer, required: true
    param! :brand_name, String, required: true

    @gig = Gig.create(brand_name: params[:brand_name], creator_id: params[:creator_id])

    if @gig.save
      render jsonapi: @gig
    else
      render jsonapi: @gig.errors, status: :unprocessable_entity
    end
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.update(brand_name: params[:brand_name], creator_id: params[:creator_id], state: params[:state])

    if @gig.save
      render jsonapi: "Gig #{@gig.id} has been updated"
    else
      render jsonapi: @gig.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy

    render jsonapi: "Gig #{@gig.id} has been deleted"
  end
end
