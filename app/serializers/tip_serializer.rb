class TipSerializer < ApplicationSerializer
  attributes :id, :likes_count

  private

  def likes_count
    object.likes.count
  end
end
