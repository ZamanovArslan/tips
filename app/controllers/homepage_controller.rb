require "active_support"

class HomepageController < ApplicationController
  expose_decorated :popular_tips_by_month, decorator: TipDecorator
  expose_decorated :popular_tips_by_everytime, decorator: TipDecorator
  expose_decorated :popular_tips_by_year, decorator: TipDecorator
  expose_decorated :tips_by_popular_life_area, decorator: TipDecorator
  expose_decorated :most_liked_tips, decorator: TipDecorator
  expose_decorated :discussed_tip_today, decorator: TipDecorator

  def index
    render "pages/home"
  end

  def popular_tips_by_month
    ::OrderedQuery.new(:views, Tip.by_last_month).limit(2).decorate
  end

  def popular_tips_by_everytime
    ::OrderedQuery.new(:views, Tip.all).limit(3).decorate
  end

  def popular_tips_by_year
    ::OrderedQuery.new(:views, Tip.by_last_year).limit(3).decorate
  end

  def tips_by_popular_life_area
    top_life_area = ::OrderedQuery.new(:views, LifeArea.all).first

    Tip.limit(2).where(life_area: top_life_area).order(created_at: :desc).decorate
  end

  def most_liked_tips
    ::OrderedQuery.new(:likes, Tip.all).limit(5)
  end

  def discussed_tip_today
    ::OrderedQuery.new(:comments, Tip.all).limit(1).decorate
  end
end
