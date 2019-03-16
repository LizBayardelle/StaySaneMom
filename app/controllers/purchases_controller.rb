class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_only, except: [:new, :create, :show]
  before_action :admin_or_creator, only: [:show]


  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to new_charge_path }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def admin_or_creator
      @purchase = Purchase.find(params[:id])
      unless (current_user && current_user.admin) || (current_user && @purchase.user_id == current_user.id)
        redirect_to root_path, notice: "Sorry, you don't have the permissions to do that."
      end
    end


    def admin_only
      unless current_user && current_user.admin
        redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(
        :first_name,
        :last_name,
        :shipping_1,
        :shipping_2,
        :shipping_city,
        :shipping_state,
        :shipping_zip,
        :shipping_country,
        :phone,
        :email,
        :total,
        :basket_id,
        :user_id
      )
    end
end