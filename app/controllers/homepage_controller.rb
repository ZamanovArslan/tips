class HomepageController < ApplicationController
  def index
    render "pages/home"
  end

  def popular_tips_by_month
    @popular_tips_by_month ||= ::OrderedQuery.new(:views, Tip.by_last_month).limit(2).decorate
  end

  def popular_tips_by_everytime
    @popular_tips_by_everytime ||= ::OrderedQuery.new(:views, Tip.all).limit(3).decorate
  end

  def popular_tips_by_year
    @popular_tips_by_year ||= ::OrderedQuery.new(:views, Tip.by_last_year).limit(3).decorate
  end

  def tips_by_popular_life_area
    top_life_area = ::OrderedQuery.new(:views, LifeArea.all).first

    @tips_by_popular_life_area ||= Tip.limit(2).where(life_area: top_life_area).order(created_at: :desc).decorate
  end

  def discussed_tip_today
    @discussed_tip_today ||= ::OrderedQuery.new(:comments, Tip.by_today).first&.decorate
  end

  def most_liked_tips
    @most_liked_tips ||= ::OrderedQuery.new(:likes, Tip.all).limit(5).decorate
  end

  helper_method :popular_tips_by_month, :popular_tips_by_everytime, :popular_tips_by_year, :tips_by_popular_life_area,
    :discussed_tip_today, :most_liked_tips
end
