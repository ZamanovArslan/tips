require "active_support"

class HomepageController < ApplicationController
  expose :popular_tips_by_month
  expose :popular_tips_by_everytime
  expose :popular_tips_by_year
  expose :tips_by_popular_life_area
  expose :most_liked_tips
  expose :discussed_tip_today

  def index
    render "pages/home"
  end

  def popular_tips_by_month
    ::OrderedQuery.new(:views, default_query.by_last_month).limit(2).decorate
  end

  def popular_tips_by_everytime
    ::OrderedQuery.new(:views, default_query).limit(3).decorate
  end

  def popular_tips_by_year
    ::OrderedQuery.new(:views, default_query.by_last_year).limit(3).decorate
  end

  def tips_by_popular_life_area
    top_life_area = ::OrderedQuery.new(:views, LifeArea.all).first

    default_query.limit(2).where(life_area: top_life_area).order(created_at: :desc).decorate
  end

  def most_liked_tips
    ::OrderedQuery.new(:likes, default_query).limit(5).decorate
  end

  def discussed_tip_today
    ::OrderedQuery.new(:comments, default_query).limit(1).decorate
  end

  private

  def default_query
    @default_query ||= Tip.where(company: current_company)
  end
end
