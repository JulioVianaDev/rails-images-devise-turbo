class PensamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pensament, only: %i[ show edit update destroy ]

  # GET /pensaments or /pensaments.json
  def index
    @pensaments = current_user.pensaments.all
  end

  # GET /pensaments/1 or /pensaments/1.json
  def show
  end

  # GET /pensaments/new
  def new
    @pensament = current_user.pensaments.new
  end

  # GET /pensaments/1/edit
  def edit
  end

  # POST /pensaments or /pensaments.json
  def create
    @pensament = current_user.pensaments.new(pensament_params)

    respond_to do |format|
      if @pensament.save
        format.html { redirect_to pensament_url(@pensament), notice: "Pensament was successfully created." }
        format.json { render :show, status: :created, location: @pensament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pensament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pensaments/1 or /pensaments/1.json
  def update
    respond_to do |format|
      if @pensament.update(pensament_params)
        format.html { redirect_to pensament_url(@pensament), notice: "Pensament was successfully updated." }
        format.json { render :show, status: :ok, location: @pensament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pensament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pensaments/1 or /pensaments/1.json
  def destroy
    @pensament.destroy

    respond_to do |format|
      format.html { redirect_to pensaments_url, notice: "Pensament was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pensament
      @pensament = current_user.pensaments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pensament_params
      params.require(:pensament).permit(:user_id, :description,:photos => [])
    end
end
