class ActionsController < ApplicationController
  def index
    render json: Action.all, status: 200
  end

  def create
    @action = Action.new(action_params)
    if @action && @action.valid?
      @action.save
      render json: @action, status: 201
    else
      render json: {error: 'Invalid Request'}
    end
  end

  def destroy
    @action = Action.find_by(action_params)
    if @action && @action.destroy
      render json: @action, status: 200
    else
      render json: {error: 'Invalid request'}
    end
  end

  private

  def action_params
    params.require(:action_content).permit(:contact, :category, :content)
  end
end
