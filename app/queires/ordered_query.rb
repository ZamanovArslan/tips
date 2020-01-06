class OrderedQuery
  attr_reader :relation, :rate_by

  RATE_OPTIONS = %i[views comments likes].freeze

  delegate :first, :page, :limit, to: :all, allow_nil: true

  def initialize(rate_by, relation = Tip.all)
    @rate_by = rate_by
    @relation = relation
  end

  def all
    @all ||= if rate_by == :views
      views_count
    elsif RATE_OPTIONS.include? rate_by
      nested_resource_count
    end
  end

  private

  def nested_resource_count
    relation.left_joins(rate_by)
            .group(:id)
            .order("COUNT(#{rate_by}.id) DESC")
  end

  def views_count
    relation.left_joins(:impressions)
            .group(:id)
            .order("COUNT(impressionable_id) DESC")
  end
end
