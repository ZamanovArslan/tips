class UpdateLike
  include Interactor

  delegate :user, :tip, to: :context

  def call
    context.fail!(error: user_like.errors) unless update_like

    context.tip = tip.reload
  end

  private

  def user_like
    @user_like = Like.find_or_initialize_by(user_id: user.id, tip_id: tip.id)
  end

  def update_like
    user_like.persisted? ? user_like.destroy : user_like.save
  end
end
