class UserController < ApplicationController
  skip_before_action :verify_authenticity_token


    def create
        user = User.create(user_params)

        if user.id % 2 == 0 
          user.turno = "X"
      else
          user.turno = "O"
      end

      
    
        if user.save
          render json: user
        else
          render status: 401
        end
    end


    def user_params
      params.permit :turno, :id
    end


end