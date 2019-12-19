class DiscussedQuery
  def all
    @all = relation.left_joins(:comments)
                   .group("comments.id")
                   .order("COUNT(comments.id) DESC")
  end
end
