module My
  class TipsController < ApplicationController
    before_action :authenticate_user!

    expose :tip
    expose :tips, -> { current_user.tips.order(created_at: :desc).page(params[:page]).decorate }
    expose :life_areas, -> { LifeArea.all.order(created_at: :desc).pluck(:en_value, :id) }

    def create
      tip.save
      render :index
    end

    def destroy
      tip.destroy
      redirect_back(fallback_location: my_tips_path)
    end

    private

    def tip_params
      params.require(:tip).permit(:title, :anonym, :description, :experience, :experience_ext, :life_area_id)
            .merge(user_id: current_user.id)
    end
  end
end
