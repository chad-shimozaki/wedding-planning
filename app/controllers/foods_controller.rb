class FoodsController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_foods = Food.all

    @list_of_foods = matching_foods.order({ :name => :asc })

    render({ :template => "foods/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_foods = Food.where({ :id => the_id })

    @the_food = matching_foods.at(0)

    render({ :template => "foods/show" })
  end

  def create
    the_food = Food.new
    the_food.meal_id = params.fetch("query_meal_id")
    the_food.caterer_id = params.fetch("query_caterer_id")
    the_food.cuisine_id = params.fetch("query_cuisine_id")
    the_food.photo_url = params.fetch("query_photo_url")

    if the_food.valid?
      the_food.save
      redirect_to("/foods", { :notice => "Food created successfully." })
    else
      redirect_to("/foods", { :alert => the_food.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_food = Food.where({ :id => the_id }).at(0)

    the_food.meal_id = params.fetch("query_meal_id")
    the_food.caterer_id = params.fetch("query_caterer_id")
    the_food.cuisine_id = params.fetch("query_cuisine_id")
    the_food.photo_url = params.fetch("query_photo_url")

    if the_food.valid?
      the_food.save
      redirect_to("/foods/#{the_food.id}", { :notice => "Food updated successfully."} )
    else
      redirect_to("/foods/#{the_food.id}", { :alert => the_food.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_food = Food.where({ :id => the_id }).at(0)

    the_food.destroy

    redirect_to("/foods", { :notice => "Food deleted successfully."} )
  end
end
