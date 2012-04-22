class UserWorkoutsController < ApplicationController

before_filter :login_required

  # GET /user_workouts
  # GET /user_workouts.json
  def index
    @user_workouts = current_user.user_workouts.group_by(&:workout_id)

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user_workout }
      end
  end

  # GET /user_workouts/1
  # GET /user_workouts/1.json
  def show
    @user_workout = UserWorkout.find(params[:id])
    @user_workout_list =  @user_workout.workout_items.group_by(&:workout_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_workout }
    end
  end

  # GET /user_workouts/new
  # GET /user_workouts/new.json
  def new
    # @user_workout = UserWorkout.new

    @workout = Workout.find params[:workout_id]
    @group = @workout.group
    @exercises = @workout.exercises 
    @user_workouts = @exercises.collect{|exercise|
      current_user.user_workouts.build(:workout => @workout, :exercise => exercise)
      #UserWorkout.new (:user => current_user, :workout => @workout, :exercise => exercise)
      # These two are the same, but the used line is more expressive
    }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_workout }
    end
  end

  # GET /user_workouts/1/edit
  def edit
    @user_workout = UserWorkout.find(params[:id])
  end

  # POST /user_workouts
  # POST /user_workouts.json
  def create
    # params[] 
    # :user_workouts => [
    #     :7 => {:weight => 10},
    #     :exercise_10 => {:weight => 11}
    # ]
    # raise params.inspect
    
    params[:user_workouts].each do |user_workout|
      exercise_id = user_workout.first
      weight = user_workout.last[:weight]
      UserWorkout.create(:workout_id => params[:workout_id], :exercise_id => exercise_id, :weight => weight, :user => current_user)
    end
    
    redirect_to user_workouts_path
    
  end

  # PUT /user_workouts/1
  # PUT /user_workouts/1.json
  def update
    @user_workout = UserWorkout.find(params[:id])

    respond_to do |format|
      if @user_workout.update_attributes(params[:user_workout])
        format.html { redirect_to @user_workout, notice: 'User workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_workouts/1
  # DELETE /user_workouts/1.json
  def destroy
    @user_workout = UserWorkout.find(params[:id])
    @user_workout.destroy

    respond_to do |format|
      format.html { redirect_to user_workouts_url }
      format.json { head :no_content }
    end
  end
end
