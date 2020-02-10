class TipSerializer < ActiveModel::Serializer
  attributes :id, :likes_count

  private

  def likes_count
    object.likes.count
  end
end
