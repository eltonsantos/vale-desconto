# frozen_string_literal: true

class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy, :diff]
  before_action :set_paper_trail_whodunnit

  # GET /discounts or /discounts.json
  def index
    @q = Discount.ransack(params[:q])
    @discounts = @q.result
  end

  # GET /discounts/1 or /discounts/1.json
  def show
    @discount = Discount.find(params[:id])
    respond_to do |format|
      format.html { render(:show) }
      format.json { render(json: @discount) }
      format.turbo_stream { render(:show) }
    end
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
  end

  # POST /discounts or /discounts.json
  def create
    @discount = current_user.discounts.new(discount_params)
    respond_to do |format|
      if @discount.save
        format.html { redirect_to(discounts_url, notice: "Discount was successfully created.") }
        format.json { render(:show, status: :created, location: @discount) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @discount.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /discounts/1 or /discounts/1.json
  def update
    respond_to do |format|
      if @discount.update(discount_params)
        format.html { redirect_to(discounts_url, notice: "Discount was successfully updated.") }
        format.json { render(:show, status: :ok, location: @discount) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @discount.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /discounts/1 or /discounts/1.json
  def destroy
    @discount.destroy!
    respond_to do |format|
      format.html { redirect_to(discounts_url, notice: "Discount was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  def history
    @versions = PaperTrail::Version.where(item_type: "Discount").order(created_at: :desc)
  end

  def diff
    @version = PaperTrail::Version.find(params[:version_id])
    @discount = @version.reify
    @next_version = @version.next ? @version.next.reify : @discount
  end

  def set_paper_trail_whodunnit
    PaperTrail.request.whodunnit = current_user.id if current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_discount
    @discount = Discount.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def discount_params
    params.require(:discount).permit(
      :image,
      :name,
      :description,
      :discount_type,
      :activation_date,
      :deactivation_date,
      :status,
      :price,
      :quantity_leve,
      :quantity_pague,
      :price_from,
      :price_to,
      :discount_percentage,
      :price_percentual,
      :price_final,
      :product_id,
    )
  end
end
