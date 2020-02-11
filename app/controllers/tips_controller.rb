class TipsController < ApplicationController
  include Pundit
  impressionist actions: [:show]
  expose :tip

  def show
    impressionist(tip.life_area)
  end
end
