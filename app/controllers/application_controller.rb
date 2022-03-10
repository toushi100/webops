class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user
    if user_signed_in?
      render json: { user: current_user }
    else
      render json: { user: "No Users" }
    end
  end

  def create
    # @post = Post.find([:id])
    @tag =   Tags.new()
    @tag.tag = params['tags']
    # @tag.post_id = @post.id
    @tag.save
    render json: {Tag: @tag}
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, avatar: [:name, :data]])
  end
end
