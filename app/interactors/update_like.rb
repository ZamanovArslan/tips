class UpdateLike
  include Interactor

  delegate :user, to: :context

  def call
    if user_like.persisted?
      context.fail!(error: user_like.errors) unless user_like.destroy
    else
      context.fail!(error: user_like.errors) unless user_like.save
    end
    context.likes_count = tip.likes
    context.tip_id = tip.id
  end

  private

  def user_like
    @user_like = Like.find_or_initialize_by(user_id: user.id, tip_id: tip.id)
  end
end
