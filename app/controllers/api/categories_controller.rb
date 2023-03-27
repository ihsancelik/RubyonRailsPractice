module Api
    class CategoriesController < ApplicationController

        protect_from_forgery with: :null_session

        def index
            @categories = Category.order(created_at: :desc)
            if !@categories.blank?
                render json: @categories, status: :ok
            else
                render json: @categories, status: :bad_request
            end
        end


        def show
            category = get_category
            if !category.blank?
                render json: category, status: :ok
            else
                render json: category, status: :bad_request
            end
        end

        def create
            @category = Category.create(category_params)
            if @category.save()
                render json: @category, status: :ok
            else
                render json: "Category cannot create", status: :bad_request
            end
        end

        def update
            category = get_category
            if category.update(category_params)
                render json: category, status: :ok
            else
                render json: "Category cannot update!", status: :bad_request
            end
        end

        def destroy
            category = get_category
            if category.destroy()
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
            params.permit(:name)
        end


    end
end
