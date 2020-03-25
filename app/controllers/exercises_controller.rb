class ExercisesController < ApplicationController
  def index
  @exercises = Exercise.where({:user_id => @current_user.id}).all.order({ :date => :desc })
  render({ :template => "exercises/index.html.erb" })
  end


  def index_cardio
  @exercises = Exercise.where({:user_id => @current_user.id}).where({:ex_type => "Cardio"}).all.order({ :date => :desc })
  render({ :template => "exercises/index.html.erb" })
  end

  def index_weights
  @exercises = Exercise.where({:user_id => @current_user.id}).where({:ex_type => "Weights"}).all.order({ :date => :desc })
  render({ :template => "exercises/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @exercise = Exercise.where({:id => the_id }).at(0)
    @weights = Weight.where(:ex_id => the_id)
    @cardios = Cardio.where(:ex_id => the_id)
    render({ :template => "exercises/show.html.erb" })
  end

  def create
    @exercise = Exercise.new
    @exercise.date = params.fetch("query_date")
    @exercise.ex_type = params.fetch("query_ex_type")
    @exercise.user_id = @current_user.id

    if @exercise.valid?
    @exercise.save
    if params.fetch("query_ex_type") == "Weights"
      redirect_to("/add_weights", { :notice => "Exercise created successfully." })
    else 
      redirect_to("/add_cardio", {:notice => "Exercise created successfully."})
    end
    else
      redirect_to("/exercises", { :notice => "Exercise failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @exercise = Exercise.where({ :id => the_id }).at(0)

    @exercise.date = params.fetch("query_date")
    @exercise.ex_type = params.fetch("query_ex_type")
    @exercise.user_id = @current_user.id

    if @exercise.valid?
      @exercise.save
      redirect_to("/exercises/#{@exercise.id}", { :notice => "Exercise updated successfully."} )
    else
      redirect_to("/exercises/#{@exercise.id}", { :alert => "Exercise failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @exercise = Exercise.where({ :id => the_id }).at(0)

    @exercise.destroy

    redirect_to("/my_workouts", { :notice => "Exercise deleted successfully."} )
  end
end
