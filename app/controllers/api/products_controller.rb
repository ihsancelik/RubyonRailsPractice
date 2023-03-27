module Api
    class ProductsController < ApplicationController

        protect_from_forgery with: :null_session
        
        def index
            @products = Product.order(created_at: :desc)
            render json: @products
        end

        def show
            @product = Product.find(params[:id])
            image = rails_blob_url(@product.product_image)
            render json: { "image":image, "data": @product }
        end

        def create
            @product = Product.create(product_params)
            @product.save()
            render json: @product
        end

        def update
            @product = Product.find(params[:id])
            @product.update(product_params)
            render json: @product
        end

        def destroy
            @product = Product.find(params[:id])
            @product.destroy()
            render json: "The product removed!"
        end

        def product_params
            params.permit(:name, :description, :quantity, :price, :product_image)
        end
        
        
    end
end