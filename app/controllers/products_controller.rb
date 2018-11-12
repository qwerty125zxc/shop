class ProductsController < ApplicationController
  def index
    @prods = Product.all
  end

  def new
    @prod = Product.new
  end

  def create
    @prod = current_user.products.build(prod_params)
    if @prod.save
    redirect_to root_path
    end
  end

  private
    def prod_params
      params.require(:product).permit(:title,:description, :price)
    end
end
