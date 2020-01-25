class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end
    
    def show
        
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category was created"
            redirect_to categories_path
        else 
            flash[:warning] = "There was a problem"
            render 'new'
        end
    end
    
    private
        def category_params
            params.require(:category).permit(:name)
            
        end
end