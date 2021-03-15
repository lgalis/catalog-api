module Api
  module V1x3
    class OrdersController < ApplicationController
      def return_order
        @order = Order.find(params.require(:order_id))
        authorize(@order)

        service_offering_check

        order = Catalog::CreateRequestForAppliedInventories.new(@order).return.order
        render :json => order
      end
    end
  end
end
