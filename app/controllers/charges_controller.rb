class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  def index
    @charges = Charge.all
  end

  def show
    respond_to do |format|
      format.pdf {
        send_data @charge.receipt.render,
          filename: "#{@charge.created_at.strftime("%Y-%m-%d")}-jungle-receipt.pdf",
          type: "application/pdf",
          disposition: :inline
      }
    end
  end

  private

    def set_charge
      @charge = current_user.charges.find(params[:id])
    end
end