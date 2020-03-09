class WeightsController < ApplicationController
  def index
    @weights = Weight.all.order({ :created_at => :desc })

    render({ :template => "weights/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @weight = Weight.where({:id => the_id }).at(0)

    render({ :template => "weights/show.html.erb" })
  end

  def create
    @weight = Weight.new
    @weight.lift = params.fetch("query_lift")
    @weight.sets = params.fetch("query_sets")
    @weight.reps = params.fetch("query_reps")
    @weight.weight = params.fetch("query_weight")
    @weight.ex_id = params.fetch("query_ex_id")

    if @weight.valid?
      @weight.save
      redirect_to("/weights", { :notice => "Weight created successfully." })
    else
      redirect_to("/weights", { :notice => "Weight failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @weight = Weight.where({ :id => the_id }).at(0)

    @weight.lift = params.fetch("query_lift")
    @weight.sets = params.fetch("query_sets")
    @weight.reps = params.fetch("query_reps")
    @weight.weight = params.fetch("query_weight")
    @weight.ex_id = params.fetch("query_ex_id")

    if @weight.valid?
      @weight.save
      redirect_to("/weights/#{@weight.id}", { :notice => "Weight updated successfully."} )
    else
      redirect_to("/weights/#{@weight.id}", { :alert => "Weight failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @weight = Weight.where({ :id => the_id }).at(0)

    @weight.destroy

    redirect_to("/weights", { :notice => "Weight deleted successfully."} )
  end
end
