class ProductsController < ApplicationController
  before_action :parent
  before_action :set_product, except: [:index, :new, :create,:search]

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
    # 親セレクトボックスの初期値（配列）
    @category_parent_array = []
    # categoriesテーブルから親カテゴリーのみを抽出し、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    # productに紐づいている孫カテゴリーの親である子カテゴリーが属している子カテゴリーの一覧を配列で取得
    @category_child_array = @product.category.parent.parent.children

    # productに紐づいている孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = @product.category.parent.children

  end

  def update
    if @product.update(product_params)
      redirect_to root_path
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
    params.require(:product).permit(:title,:price,:explanation,:delivery_burden_id,:product_status_id,:estimated_shipping_id,:category_id,:postal_prefectures_id,:brand,images_attributes: [:image, :_destory, :id]).merge(user_id: current_user.id)
  end

  def parent
    @parent = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end