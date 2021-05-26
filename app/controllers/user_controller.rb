class UserController < ApplicationController


    def create
        user = User.new(user_params)
    
        if user.save
          render json: user
        else
          render json: format_error(request.path, user.errors.full_messages), status: 401)
        end
    end



end
