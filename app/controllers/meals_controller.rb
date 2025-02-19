class MealsController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })
  
  def index
    matching_meals = Meal.all

    @list_of_meals = matching_meals.order({ :name => :asc })

    @list_of_caterers = Caterer.all.order({ :name => :asc })

    @list_of_events = Event.all.order({ :name => :asc })

    render({ :template => "meals/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_meals = Meal.where({ :id => the_id })

    @the_meal = matching_meals.at(0)

    @list_of_caterers = Caterer.all.order({ :name => :asc })

    @the_meal_caterer_1 = Caterer.where({ :id => @the_meal.caterer_1_id }).at(0)

    @the_meal_caterer_2 = Caterer.where({ :id => @the_meal.caterer_2_id }).at(0)

    @list_of_events = Event.all.order({ :name => :asc })

    @the_meal_event = Event.where({ :id => @the_meal.event_id }).at(0)

    render({ :template => "meals/show" })
  end

  def create
    the_meal = Meal.new
    the_meal.name = params.fetch("query_name")

    caterer_1_name = params.fetch("query_caterer_1_name")
    the_meal.caterer_1_id = Caterer.where({ :name => caterer_1_name }).at(0).id

    caterer_2_name = params.fetch("query_caterer_2_name")
    the_meal.caterer_2_id = Caterer.where({ :name => caterer_2_name }).at(0).id

    event_name = params.fetch("query_event_name")
    the_meal.event_id = Event.where({ :name => event_name }).at(0).id

    the_meal.photo_url = params.fetch("query_photo_url")

    if the_meal.valid?
      the_meal.save
      redirect_to("/meals", { :notice => "Meal created successfully." })
    else
      redirect_to("/meals", { :alert => the_meal.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_meal = Meal.where({ :id => the_id }).at(0)
    the_meal.name = params.fetch("query_name")

    caterer_1_name = params.fetch("query_caterer_1_name")
    caterer_2_name = params.fetch("query_caterer_2_name")
    the_meal.caterer_1_id = Caterer.where({ :name => caterer_1_name }).at(0).id
    the_meal.caterer_2_id = Caterer.where({ :name => caterer_2_name }).at(0).id

    event_name = params.fetch("query_event_name")
    the_meal.event_id = Event.where({ :name => event_name }).at(0).id

    the_meal.photo_url = params.fetch("query_photo_url")
    
    if the_meal.valid?
      the_meal.save
      redirect_to("/meals/#{the_meal.id}", { :notice => "Meal updated successfully."} )
    else
      redirect_to("/meals/#{the_meal.id}", { :alert => the_meal.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_meal = Meal.where({ :id => the_id }).at(0)

    the_meal.destroy

    redirect_to("/meals", { :notice => "Meal deleted successfully."} )
  end
end
