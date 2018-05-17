class CompaniesController < ApplicationController
  def index
    render json: Company.all, status: 200
  end

  def create
    @comp = Company.new(company_params)
    if @comp && @comp.valid?
      # @comp.save
      render json: @comp, status: 201
    else
      render json: {error: 'Invalid request'}
    end
  end

  def destroy
    if Company.find(company_params).destroy
      render json: @comp, status: 200
    else
      render json: {error: 'Invalid request'}
    end
  end

  private

  def company_params
    params.require(:company).permit(:id, :name)
  end
end
