class Api::ItemsController < ApplicationController
  # html
  # xml
  # json

  def index
    # @items = Item.all 
    render json: Item.all
    # [{id, name, complete}]
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item 
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    # update with item params if you want to update the object
    # if @item.update(item_params)
    @item.update(complete: !@item.complete)
    render json: @item
  end

  def destroy
    Item.find(params[:id]).destroy
    render json: { message: 'Item is deleted' }
  end

  private

    def item_params
      params.require(:item).permit(:name, :complete)
    end

end
