class DessertsController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show]
  before_filter :find_user, only: [:index, :show]

  before_filter :find_desserts_category, only: [:index]
  before_action :set_dessert, only: [:show, :edit, :update, :destroy]
  before_action  :find_options, except: [:index, :show, :destroy]

  # GET /desserts
  # GET /desserts.json
  def index
    @desserts = Dessert.paginate(:page => params[:page], :per_page => 6)
    redirect_to @desserts_category
  end

  # GET /desserts/1
  # GET /desserts/1.json
  def show
  end

  # GET /desserts/new
  def new
    @dessert = Dessert.new
    @dessert.desserts_category_id = params[:desserts_category_id]
  end

  # GET /desserts/1/edit
  def edit
  end

  # POST /desserts
  # POST /desserts.json
  def create
    @dessert = Dessert.new(dessert_params)

    respond_to do |format|
      if @dessert.save
        format.html { redirect_to @dessert}
        format.json { render :show, status: :created, location: @dessert }
      else
        format.html { render :new }
        format.json { render json: @dessert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desserts/1
  # PATCH/PUT /desserts/1.json
  def update
    respond_to do |format|
      if @dessert.update(dessert_params)
        format.html { redirect_to @dessert}
        format.json { render :show, status: :ok, location: @dessert }
      else
        format.html { render :edit }
        format.json { render json: @dessert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desserts/1
  # DELETE /desserts/1.json
  def destroy
    @desserts_category = @dessert.desserts_category
    @dessert.destroy
    respond_to do |format|
      format.html { redirect_to @desserts_category}
      format.json { head :no_content }
    end
  end

  protected
    def find_desserts_category
      @desserts_category = DessertsCategory.find(params[:desserts_category_id])
    end

    def find_options
      @options = DessertsCategory.order(:name).collect do |c|
          [c.name, c.id]
       end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dessert
      @dessert = Dessert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dessert_params
      params.require(:dessert).permit(:name, :image_url, :description, :retail_price, :wholesale_price, :desserts_category_id)
    end
end
