module My
  class ExperiencesController < ApplicationController
    before_action :authenticate_user!

    expose :experience
    expose :experiences, ->{ current_user.experiences }
    expose :life_areas, ->{ fetch_life_areas }

    def create
      if experience.save
        redirect_to my_experiences_path
      else
        render :index
      end
    end

    def destroy
      experience.destroy
      redirect_back(fallback_location: my_experiences_path)
    end

    private

    def experience_params
      params.require(:experience).permit(:experience, :experience_ext, :life_area_id)
                                 .merge(user_id: current_user.id)
    end

    def fetch_life_areas
      LifeArea.all.order(created_at: :desc).pluck(:en_value, :id)
    end
  end
end
