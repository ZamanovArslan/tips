module Api
  module V1
    module Tips
      class LikesController < ApplicationController
        before_action :authenticate_user!
        expose :tip

        def update
          result = UpdateLike.call(user: current_user, tip: tip)
          if result.success?
            render json: result.tip
          else
            render json: result.error, status: 422
          end
        end
      end
    end
  end
end
