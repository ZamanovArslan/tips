class TipsController < ApplicationController
  impressionist actions: [:show]
  expose :tip

  def show
    impressionist(tip.life_area)
  end
end
