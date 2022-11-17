class RecipelistsController < ApplicationController
  before_action :set_recipelist, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /recipelists or /recipelists.json
  def index
    @recipelists = Recipelist.all
  end

  # GET /recipelists/1 or /recipelists/1.json
  def show
  end

  # GET /recipelists/new
  def new
    # @recipelist = Recipelist.new
    @recipelist = current_user.recipelists.build
  end

  # GET /recipelists/1/edit
  def edit
  end

  # POST /recipelists or /recipelists.json
  def create
    # @recipelist = Recipelist.new(recipelist_params)
    @recipelist = current_user.recipelists.build(recipelist_params)

    respond_to do |format|
      if @recipelist.save
        format.html { redirect_to recipelist_url(@recipelist), notice: "Recipelist was successfully created." }
        format.json { render :show, status: :created, location: @recipelist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipelists/1 or /recipelists/1.json
  def update
    respond_to do |format|
      if @recipelist.update(recipelist_params)
        format.html { redirect_to recipelist_url(@recipelist), notice: "Recipelist was successfully updated." }
        format.json { render :show, status: :ok, location: @recipelist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipelists/1 or /recipelists/1.json
  def destroy
    @recipelist.destroy

    respond_to do |format|
      format.html { redirect_to recipelists_url, notice: "Recipelist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @recipelist = current_user.recipelists.find_by(id: params[:id])
    redirect_to recipelists_path, notice: "No permissions to make changes!" if @recipelist.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipelist
      @recipelist = Recipelist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipelist_params
      params.require(:recipelist).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
    end
end
