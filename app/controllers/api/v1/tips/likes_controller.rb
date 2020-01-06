class Api::V1
  module Tips
    class LikesController < ApplicationController
      before_action :authenticate_user!
      expose :tip

      def update
        result = UpdateLike.call(user: current_user, tip: tip)
        if result.success?
          render json: { count: result.likes_count, id: result.tip_id }
        else
          render json: result.errors, status: 422
        end
      end
    end
  end
end
