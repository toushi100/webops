class HardJob
  include Sidekiq::Job

  def perform(post)
    Post.find(post).destroy
  end
end
