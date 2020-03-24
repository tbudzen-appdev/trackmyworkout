class CardiosController < ApplicationController
  def index
    @cardios = Cardio.all.order({ :created_at => :desc })

    render({ :template => "cardios/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @cardio = Cardio.where({:id => the_id }).at(0)

    render({ :template => "cardios/show.html.erb" })
  end

  def add_cardio
  the_id = session.fetch(:user_id)
  @last_ex_id = Exercise.where({:user_id => the_id}).last.id
  @cardios = Cardio.where({:ex_id => @last_ex_id}).order({:created_at => :desc })
  render({ :template => "cardios/add_cardios.html.erb" })
  end



  def create
    @cardio = Cardio.new
    @cardio.cardio_type = params.fetch("query_cardio")
    @cardio.distance = params.fetch("query_distance")
    @cardio.time = params.fetch("query_time")
    @cardio.ex_id = params.fetch("query_ex_id")

    if @cardio.valid?
      @cardio.save
      redirect_to("/add_cardio", { :notice => "Cardio created successfully." })
    else
      redirect_to("/add_cardio", { :notice => "Cardio failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @cardio = Cardio.where({ :id => the_id }).at(0)

    @cardio.cardio_type = params.fetch("query_cardio_type")
    @cardio.time = params.fetch("query_time")
    @cardio.ex_id = params.fetch("query_ex_id")

    if @cardio.valid?
      @cardio.save
      redirect_to("/cardios/#{@cardio.id}", { :notice => "Cardio updated successfully."} )
    else
      redirect_to("/cardios/#{@cardio.id}", { :alert => "Cardio failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @cardio = Cardio.where({ :id => the_id }).at(0)

    @cardio.destroy

    redirect_to("/cardios", { :notice => "Cardio deleted successfully."} )
  end
end
