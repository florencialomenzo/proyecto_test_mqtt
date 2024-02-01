class EmqxSuscriberController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        suscriber = Mqtt::Suscriber.new
        response = suscriber.start_subscription(params[:topic])
        render json: { message: response }, status: :ok
    end
end