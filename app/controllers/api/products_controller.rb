module Api
    class ProductsController < ApplicationController

        protect_from_forgery with: :null_session
        
        before_action :get_product, only: %i[update show destroy]
        after_action :after_action_test, only: %i[index]

        def index
            @products = Product.all
            if !@products.blank?
                @message = "Listed the products"
                render :index, status: :ok
            else
                @message = "Products count is 0"
                handle_error
            end
        end

        def show
            if !@product.blank?
                render :show, status: :ok
            else
                handle_error
            end
        end

        def get_by_name
            @products = Product.where(name: params[:name]).order(created_at: :desc)
            if !@products.blank?
                render 'index.json.jbuilder', status: :ok
            else
                @message = "Could not find product with by name"
                handle_error
            end
        end

        def create
            @product = Product.create(product_params)
            if @product.valid?
                @product.save()
                @message = "Product created"
                render :create, status: :ok
            else
                @message = @product.errors.full_messages
                handle_error
            end
        end

        def update
            if @product.update(product_params)
                render :update, status: :ok
            else
                @message = "Could not be updated"
                handle_error
            end
        end

        def destroy
            if @product.destroy()
                render :destroy, status: :ok
            else
                @message = "Could not be deleted"
                handle_error
            end
        end

        def handle_error
            render :error, status: :bad_request
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