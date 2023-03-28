module Api
    class ProductsController < ApplicationController

        protect_from_forgery with: :null_session
        
        before_action :get_product, only: %i[update show destroy]
        after_action :after_action_test, only: %i[index]

        def index
            @products = Product.order(created_at: :desc)
            render json: @products
        end

        def show
            # image = rails_blob_url(@product.product_image)
            render json: { "data": { product: @product, category: @product.category } }
        end

        def create
            @product = Product.create(product_params)
            if @product.valid?
                @product.save()
                render json: @product
            else
                render json: @product.errors.full_messages, status: :bad_request
            end
        end

        def update
            if @product.update(product_params)
                render json: @product, status: :ok
            else
                render json: @product.errors.full_messages, status: :bad_request
            end
        end

        def destroy
            @product.destroy()
            render json: "The product removed!"
        end

        def product_params
            params.permit(:name, :description, :quantity, :price, :product_image)
        end


        def get_product
            @product = Product.find(params[:id])
        end
        
        def after_action_test
            print "\n\n@@@@@@@@@ Hello! I'm here man! ;) @@@@@@@@@\n\n"
        end
        
    end
end