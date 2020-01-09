require 'active_support'

class HomepageController < ApplicationController
  expose :popular_tips_by_month, decorate: ->(tips){ TipDecorator.new(tips) }
  expose :popular_tips_by_everytime, decorate: ->(tips){ TipDecorator.new(tips) }
  expose :popular_tips_by_year, decorate: ->(tips){ TipDecorator.new(tips) }
  expose :tips_by_popular_life_area, decorate: ->(tips){ TipDecorator.new(tips) }
  expose :discussed_tip_today, decorate: ->(tips){ TipDecorator.new(tips) }
  expose :most_liked_tips, decorate: ->(tips){ TipDecorator.new(tips) }

  def index
    render "pages/home"
  end

  private

  def popular_tips_by_month
    @popular_tips_by_month ||= ::OrderedQuery.new(:views, Tip.by_last_month).limit(2)
  end

  def popular_tips_by_everytime
    @popular_tips_by_everytime ||= ::OrderedQuery.new(:views, Tip.all).limit(3)
  end

  def popular_tips_by_year
    @popular_tips_by_year ||= ::OrderedQuery.new(:views, Tip.by_last_year).limit(3)
  end

  def tips_by_popular_life_area
    top_life_area = ::OrderedQuery.new(:views, LifeArea.all).first

    @tips_by_popular_life_area ||= Tip.limit(2).where(life_area: top_life_area).order(created_at: :desc)
  end

  def discussed_tip_today
    @discussed_tip_today ||= ::OrderedQuery.new(:comments, Tip.by_today).first&
  end

  def most_liked_tips
    @most_liked_tips ||= ::OrderedQuery.new(:likes, Tip.all).limit(5)
  end
end
