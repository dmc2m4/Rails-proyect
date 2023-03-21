class ApplicationController < ActionController::Base

    include JsonWebToken

    before_action :authenticate_request

    private

    def authenticate_request
        header = request.headers['Authorization']
        header = request.split(" ").last if header
        decoded = jwt_decoded(header)
        @current_user = User.find(decoded[:user_id])
    end

end
