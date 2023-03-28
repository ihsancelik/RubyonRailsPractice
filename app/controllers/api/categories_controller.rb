module Api
  class CategoriesController < ApplicationController
    protect_from_forgery with: :null_session

    before_action :get_category, only: %i[show update destroy]

    def index
      @categories = Category.order(created_at: :desc)
      if !@categories.blank?
        render json: @categories, status: :ok
      else
        render json: @categories, status: :bad_request
      end
    end

    def show
      if !@category.blank?
        render json: @category, status: :ok
      else
        render json: @category, status: :bad_request
      end
    end

    def create
      @category = Category.create(category_params)
      if @category.valid?
        if @category.save
          render json: @category, status: :ok
        else
          render json: "Category cannot create", status: :bad_request
        end
      else
        render json: @category.errors.full_messages, status: :bad_request
      end
    end

    def update
      if @category.update(category_params)
        render json: @category, status: :ok
      else
        render json: @category.errors.full_messages, status: :bad_request
      end
    end

    def destroy
      if @category.destroy
        render json: "Category removed", status: :ok
      else
        render json: "Category cannot removed", status: :bad_request
      end
    end

    private

    def get_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.permit(:name, :description)
    end
  end
end
