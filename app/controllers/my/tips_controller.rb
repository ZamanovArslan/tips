module My
  class TipsController < ApplicationController
    before_action :authenticate_user!

    expose :tip, parent: :current_user
    expose :tips, :fetch_tips
    expose :life_areas, -> { LifeArea.all.order(created_at: :desc).pluck(:en_value, :id) }

    def create
      if tip.save
        redirect_to my_tips_path
      else
        render :index
      end
    end

    def destroy
      tip.destroy
      redirect_back(fallback_location: my_tips_path)
    end

    private

    def tip_params
      params.require(:tip).permit(:title, :anonym, :description, :experience, :experience_ext, :life_area_id)
            .merge(user_id: current_user.id, company: current_company)
    end

    def fetch_tips
      current_user.tips.where(company: current_company).order(created_at: :desc).page(params[:page]).decorate
    end
  end
end
