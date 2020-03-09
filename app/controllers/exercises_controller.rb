class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all.order({ :created_at => :desc })

    render({ :template => "exercises/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @exercise = Exercise.where({:id => the_id }).at(0)

    render({ :template => "exercises/show.html.erb" })
  end

  def create
    @exercise = Exercise.new
    @exercise.date = params.fetch("query_date")
    @exercise.ex_type = params.fetch("query_ex_type")
    @exercise.user_id = params.fetch("query_user_id")

    if @exercise.valid?
      @exercise.save
      redirect_to("/exercises", { :notice => "Exercise created successfully." })
    else
      redirect_to("/exercises", { :notice => "Exercise failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @exercise = Exercise.where({ :id => the_id }).at(0)

    @exercise.date = params.fetch("query_date")
    @exercise.ex_type = params.fetch("query_ex_type")
    @exercise.user_id = params.fetch("query_user_id")

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

    redirect_to("/exercises", { :notice => "Exercise deleted successfully."} )
  end
end
