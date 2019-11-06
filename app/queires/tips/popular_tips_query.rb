module Tips
  class PopularTipsQuery
    attr_reader :user_ids, :relation

    def initialize(relation = Tip.all)
      @relation = relation
    end

    def all
      relation.joins("INNER JOIN (SELECT impressionable_id, count(*) FROM impressions WHERE action_name = 'show' GROUP BY impressionable_id) i1
                      ON i1.impressionable_id = tips.id")
              .order("count DESC")

    end
  end
end
