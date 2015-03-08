class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profile1s
  # GET /profile1s.json
  def index
    @profiles = Profile.all
  end

  # GET /profile1s/1
  # GET /profile1s/1.json
  def show
  end

  # GET /profile1s/new
  def new
    @profile = Profile.new
  end

  # GET /profile1s/1/edit
  def edit
  end

  # POST /profile1s
  # POST /profile1s.json
  def create
    @profile = Profile.new(profile_params)
    @profile.id = Profile.all.length + 1

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile1s/1
  # PATCH/PUT /profile1s/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile1s/1
  # DELETE /profile1s/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:profile)
    end
end
