class ProfilesController < ApplicationController
  before_action :set_profile1, only: [:show, :edit, :update, :destroy]

  # GET /profile1s
  # GET /profile1s.json
  def index
    @profile1s = Profile1.all
  end

  # GET /profile1s/1
  # GET /profile1s/1.json
  def show
  end

  # GET /profile1s/new
  def new
    @profile1 = Profile1.new
  end

  # GET /profile1s/1/edit
  def edit
  end

  # POST /profile1s
  # POST /profile1s.json
  def create
    @profile1 = Profile1.new(profile1_params)

    respond_to do |format|
      if @profile1.save
        format.html { redirect_to @profile1, notice: 'Profile1 was successfully created.' }
        format.json { render :show, status: :created, location: @profile1 }
      else
        format.html { render :new }
        format.json { render json: @profile1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile1s/1
  # PATCH/PUT /profile1s/1.json
  def update
    respond_to do |format|
      if @profile1.update(profile1_params)
        format.html { redirect_to @profile1, notice: 'Profile1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile1 }
      else
        format.html { render :edit }
        format.json { render json: @profile1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile1s/1
  # DELETE /profile1s/1.json
  def destroy
    @profile1.destroy
    respond_to do |format|
      format.html { redirect_to profile1s_url, notice: 'Profile1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile1
      @profile1 = Profile1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile1_params
      params.require(:profile1).permit(:profile)
    end
end
