class GiftsController < ApplicationController
  before_action :set_gift, only: [:update, :destroy]
  before_action :authenticate_user!


  def update
    @gift.user_id = current_user.id
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to occasion_url(@gift.occasion_id), notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:user_id, :name, :price, :store, :purchased, :notes, :person_id, :occasion_id)
    end
end
