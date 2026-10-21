class PrintRequestsController < ApplicationController
  def create
    # Hidden field that real visitors never fill in; bots do.
    return redirect_to(made_to_order_path(sent: 1)) if params[:website].present?
    @request = PrintRequest.new(params.require(:print_request).permit(:name, :email, :description, :quantity, :needed_by))
    if @request.save
      redirect_to made_to_order_path(sent: 1, anchor: "request")
    else
      render "pages/made_to_order", status: :unprocessable_entity
    end
  end
end
