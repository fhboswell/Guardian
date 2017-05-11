
module Api
  module V1
    class AuthenticationController < ApplicationController

      def authenticate_user
        user = User.find_for_database_authentication(email: params[:email])
        if user.valid_password?(params[:password])
          render json: payload(user)
        else
          render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
        end
      end

      private

      def payload(user)
        return nil unless user and user.id
        {
          auth_token: JsonWebToken.encode({user_id: user.id}),
          user: {id: user.id, email: user.email, type_key: user.type_key, uuid: user.uuid}
        }
      end



      protected

      def api_error(status: 500, errors: [])
        unless Rails.env.production?
          puts errors.full_messages if errors.respond_to? :full_messages
        end
        head status: status and return if errors.empty?

        render json: jsonapi_format(errors).to_json, status: status
      end
      def authenticate_request!
        unless user_id_in_token?
          render json: { errors: ['Not Authenticated'] }, status: :unauthorized
          return
        end
        @current_user = User.find(auth_token[:user_id])
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end

      private
      def http_token
          @http_token ||= if request.headers['Authorization'].present?
            request.headers['Authorization'].split(' ').last
          end
      end

      def auth_token
        @auth_token ||= JsonWebToken.decode(http_token)
      end

      def user_id_in_token?
        http_token && auth_token && auth_token[:user_id].to_i
      end
      
    end
  end
end