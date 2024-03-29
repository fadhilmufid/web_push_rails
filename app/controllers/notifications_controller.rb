class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end

    def create
        notification = WebpushNotification.find_by(auth_key: params[:keys][:auth])
        if !notification
            notification = WebpushNotification.new(
                endpoint: params[:endpoint],
                auth_key: params[:keys][:auth],
                p256dh_key:  params[:keys][:p256dh]
            )
        end

        if notification.save
            render json: notification
        else
            render json: notification.errors.full_messages
        end
    end
end
