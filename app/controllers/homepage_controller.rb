class HomepageController < ApplicationController

  def index
    render "pages/home"
  end

  private

  def popular_tips_by_month
    ::Tips::PopularTipsQuery.new(Tip.by_last_month).all.decorate
  end

  def popular_tips_by_everytime
    ::Tips::PopularTipsQuery.new(Tip.by_last_month)
  end

  helper_method :popular_tips_by_month
end
