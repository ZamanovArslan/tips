class TipsController < ApplicationController
  before_action :authenticate_user!, if: -> { tip.company }
  impressionist actions: [:show]
  expose :tip

  def show
    authorize tip
    impressionist(tip.life_area)
  end
end
