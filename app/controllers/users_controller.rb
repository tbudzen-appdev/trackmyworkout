class UsersController < ApplicationController
  # skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.d_o_b = params.fetch("query_dob")
    @user.height_ft = params.fetch("query_height_ft")
    @user.height_in = params.fetch("query_height_in")
    @user.sex = params.fetch("query_sex")
    @user.weight = params.fetch("query_weight")
    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/my_workouts", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def my_profile
    @user_exercises = Exercise.where({:user_id => session.fetch(:user_id)}).pluck(:id)
    @maxbench = Weight.where({:ex_id => @user_exercises}).where({:lift => "Bench Press"}).order({:weight => :desc}).first
    @maxsquat = Weight.where({:ex_id => @user_exercises}).where({:lift => "Squat"}).order({:weight => :desc}).first
    @maxdeadlift = Weight.where({:ex_id => @user_exercises}).where({:lift => "Deadlift"}).order({:weight => :desc}).first
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.d_o_b = params.fetch("query_d_o_b")
    @user.height_ft = params.fetch("query_height_ft")
    @user.height_in = params.fetch("query_height_in")
    @user.sex = params.fetch("query_sex")
    @user.weight= params.fetch("query_weight")

    if @user.valid?
      @user.save

      redirect_to("/my_profile", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
