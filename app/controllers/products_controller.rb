class ProductsController < ApplicationController
  before_action :parent
  before_action :set_product, except: [:index, :new, :create,:search]

  def index
  end

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create

    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      flash.now[:alert] = '※画像・リストの選択または入力してください。'
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def delete
    @product.destroy
    redirect_to root_path
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
    params.require(:product).permit(:title,:price,:explanation,:delivery_burden_id,:product_status_id,:estimated_shipping_id,:category_id,:postal_prefectures_id,:brand,images_attributes: [:image, :_destory, :id]).merge(user_id: current_user.id)
  end

  def parent
    @parent = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end