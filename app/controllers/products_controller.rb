class ProductsController < ApplicationController
  before_action :parent,only:[:new,:create,:edit,:update]
  before_action :set_product, except: [:index, :new, :create,:search]
  before_action :category,only:[:edit,:update]
  
  def index
    @products = Product.includes(:images).limit(5)
  end

  def show
    @products = Product.includes(:images)
    @category = @product.category
  end

  def new
    @product = Product.new
    @product.images.new
    @products = Product.includes(:images).limit(5)
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      unless @product.images.present?
        @product.images.new
        render :new
      else
        render :new
      end
    end
  end

  def edit
  end

  def update

    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:title,:price,:explanation,:delivery_burden_id,:product_status_id,:estimated_shipping_id,:category_id,:postal_prefectures_id,:brand,images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def parent
    @parents = Category.where(ancestry: nil)
  end

  def category
    @grandchild = @product.category
    @child = @grandchild.parent
    @parent = @child.parent
    @grandchildren = @child.children
    @children = @parent.children
  end

  def set_product
    @product = Product.find(params[:id])
  end
end