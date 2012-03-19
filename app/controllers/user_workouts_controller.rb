class UserWorkoutsController < ApplicationController
  # GET /user_workouts
  # GET /user_workouts.json
  def index
    @user_workouts = UserWorkout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_workouts }
    end
  end

  # GET /user_workouts/1
  # GET /user_workouts/1.json
  def show
    @user_workout = UserWorkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_workout }
    end
  end

  # GET /user_workouts/new
  # GET /user_workouts/new.json
  def new
    # @user_workout = UserWorkout.new
    @group = Group.first
    @workout = @group.workouts.first
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
    #     :excerise_7 => {:weight => 10},
    #     :exercise_10 => {:weight => 11}
    # ]
    
    params[:user_workouts].each do |user_workout|
      user_workout.each do |exercise_id_string, weight_hash|
        UserWorkout.new(:exercise_id => exercise_id_string.gsub(/excerise_/, ""), :weight => weight_hash[:weight])
      end
    end
    
    @user_workout = UserWorkout.new(params[:user_workout])

    respond_to do |format|
      if @user_workout.save
        format.html { redirect_to @user_workout, notice: 'User workout was successfully created.' }
        format.json { render json: @user_workout, status: :created, location: @user_workout }
      else
        format.html { render action: "new" }
        format.json { render json: @user_workout.errors, status: :unprocessable_entity }
      end
    end
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
