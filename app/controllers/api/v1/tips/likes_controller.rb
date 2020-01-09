module Api
  module V1
    module Tips
      class LikesController < ApplicationController
        before_action :authenticate_user!

        expose :tip

        def update
          user_like.persisted? ? user_like.destroy : user_like.save

          render json: { count: tip.likes.count, id: tip.id }
        end

        private

        def user_like
          @user_like = Like.find_or_initialize_by(user_id: current_user.id, tip_id: tip.id)
        end
      end
    end
  end
end
