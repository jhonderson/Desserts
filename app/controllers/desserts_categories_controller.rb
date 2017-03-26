class DessertsCategoriesController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show]
  before_filter :find_user, only: [:index, :show]
  before_action :set_desserts_category, only: [:show, :edit, :update, :destroy]

  # GET /desserts_categories
  # GET /desserts_categories.json
  def index
    @desserts_categories = DessertsCategory.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /desserts_categories/1
  # GET /desserts_categories/1.json
  def show
  end

  # GET /desserts_categories/new
  def new
    @desserts_category = DessertsCategory.new
  end

  # GET /desserts_categories/1/edit
  def edit
  end

  # POST /desserts_categories
  # POST /desserts_categories.json
  def create
    @desserts_category = DessertsCategory.new(desserts_category_params)

    respond_to do |format|
      if @desserts_category.save
        format.html { redirect_to @desserts_category}
        format.json { render :show, status: :created, location: @desserts_category }
      else
        format.html { render :new }
        format.json { render json: @desserts_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desserts_categories/1
  # PATCH/PUT /desserts_categories/1.json
  def update
    respond_to do |format|
      if @desserts_category.update(desserts_category_params)
        format.html { redirect_to @desserts_category}
        format.json { render :show, status: :ok, location: @desserts_category }
      else
        format.html { render :edit }
        format.json { render json: @desserts_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desserts_categories/1
  # DELETE /desserts_categories/1.json
  def destroy
    @desserts_category.destroy
    respond_to do |format|
      format.html { redirect_to desserts_categories_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desserts_category
      @desserts_category = DessertsCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desserts_category_params
      params.require(:desserts_category).permit(:name, :image_url)
    end
end
