class ProductsController < ApplicationController
  before_action :load_cart

  def index
    @get_nutty = true
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: @products, only: [:title, :sku, :price], methods: [:partner_link] }
      format.xml { render xml: @products.as_json(only: [:title, :sku, :price], methods: [:partner_link]) }
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @title = @product.title
  end
end
