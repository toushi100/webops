class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = get_user_form_token
    render json: {
             message: "If you see this youre in",
             user: current_user.email,
           }
  end

  private

  def get_user_from_token
    jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1],
                             Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload["sub"]
    User.find(user_id.to_s)
  end
end
