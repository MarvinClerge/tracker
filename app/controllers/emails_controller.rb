class EmailsController < ApplicationController
  def index
    render json: Email.all, status: 200
  end

  def create
    @email = Email.new(email_params)
    if @email && @email.valid?
      render json: @email, status: 201
    else
      render json: {error: 'Invalid Request'}
    end
  end

  def update
    @email = Email.find_by(email_params)
    if @email && @email.valid?
      @updated_email = Email.find_by(params[:email][:id]).update(@email)
      render json: @updated_email, status: 200
    end
  end

  def destroy
    @email = Email.find_by(email_params)
    if @email && @email.destroy
      render json: @email, status: 200
    else
      render json: {error: 'Invalid request'}
    end
  end

  private

  def email_params
    params.require(:email).permit(:id, :title, :content, :category)
  end
end
