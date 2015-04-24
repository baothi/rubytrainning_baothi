class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments
    # @comment = Comment.new
  end

  def user_send_mail
    if current_user
      @products = Product.all
      ProductMailer.send_email(@products,current_user.email).deliver
      redirect_to products_url
      format.html { redirect_to products_url, notice: 'goi mail thanh cong.' }
    end
  end

  def comments
    # byebug
    # @comments = Comment.new(:content=>params[contents])
    # byebug
    # @comments = @product.comments
    # @comment = Comment.new
    product_id       = params[:product_id]
    comments_content = params[:comment_content]
    comment          = Comment.new(:product_id => product_id,:content => comments_content)
    comment.save
    comments         = Comment.where(:product_id => product_id)
    render :partial => "products/comments", :locals => {:comments => comments}
    puts "successfully"

    # puts "1234567"
    # puts "product_id ", product_id
    # puts "comments_content ", comments_content
  end
  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    # byebug
    @product = Product.new(product_params)

    # respond_to do |format|
      if @product.save
        if params[:product][:avatar].present?
          render :crop
        else
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      end
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    byebug
    # puts "1234567890123456789012345678"
    # respond_to do |format|
      
      if @product.update(product_params)
        if params[:product][:avatar].present?
          render :crop
        else
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      end
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :avatar)
    end
end
