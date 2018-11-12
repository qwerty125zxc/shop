class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @prod = Product.new
  end

  def create
    @prod = current_user.products.build(prod_params)
    if @prod.save
    redirect_to root_path
    end
  end

  def show
    @prod = Product.find_by(id:params[:id])
  end

  private
    def prod_params
      params.require(:product).permit(:title,:description, :price)
    end
end
