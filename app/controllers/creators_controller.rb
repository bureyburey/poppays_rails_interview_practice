class CreatorsController < ApplicationController
  def index
    @creators = Creator.all

    render jsonapi: @creators, include: params[:include]
  end

  def show
    @creator = Creator.find(params[:id])

    render jsonapi: @creator
  end

  def create
    @creator = Creator.create(first_name: params[:first_name], last_name: params[:last_name])

    if @creator.save
      render jsonapi: @creator
    else
      render jsonapi: @creator.errors, status: :unprocessable_entity
    end
  end

  def update
    @creator = Creator.find(params[:id])
    @creator.update(first_name: params[:first_name], last_name: params[:last_name])

    render jsonapi: "Creator #{@creator.first_name} #{@creator.last_name} has been updated"
  end

  def destroy
    @creator = Creator.find(params[:id])
    @creator.destroy

    render jsonapi: "Creator #{@creator.first_name} #{@creator.last_name} has been deleted"
  end
end
