class CreatorsController < ApplicationController
  def index
    param! :sort, String, in: ["first_name", "last_name"]
    param! :sort_direction, String, in: ["asc", "desc"], transform: :downcase, default: "asc"
    param! :offset, Integer, min: 0
    param! :limit, Integer, min: 1

    @creators = Creator.all

    if params[:sort] and params[:sort_direction]
      @creators = @creators.order("#{params[:sort]} #{params[:sort_direction]}")
    end
    if params[:limit] and params[:offset]
      @creators = @creators.limit(params[:limit]).offset(params[:offset])
    end

    render jsonapi: @creators, include: params[:include]
  end

  def show
    @creator = Creator.find(params[:id])

    render jsonapi: @creator, include: params[:include]
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

  def search
    param! :q, String, required: true
    param! :categories, Array
    param! :sort, String, default: "title"
    param! :order, String, in: %w(asc desc), transform: :downcase, default: "asc"
    param! :price, String, format: /[<\=>]\s*\$\d+/

    # Access the parameters using the params object (like params[:q]) as you usually do...
    @creator = Creator.where("first_name LIKE ? OR last_name LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")

    render jsonapi: @creator
  end

end
