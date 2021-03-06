class EntsController < ApplicationController
  before_action :set_ent, only: %i[show edit update destroy photos timelapses coverage]
  before_action :authenticate_user!, except: %i[photos timelapses coverage]

  # GET /ents or /ents.json
  def index
    @ents = Ent.all
  end

  # GET /ents/1 or /ents/1.json
  def show
  end

  # GET /ents/new
  def new
    @ent = Ent.new
  end

  # GET /ents/1/edit
  def edit
  end

  # POST /ents or /ents.json
  def create
    @ent = Ent.new(ent_params)

    respond_to do |format|
      if @ent.save
        format.html { redirect_to @ent, notice: "Ent was successfully created." }
        format.json { render :show, status: :created, location: @ent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ents/1 or /ents/1.json
  def update
    respond_to do |format|
      if @ent.update(ent_params)
        format.html { redirect_to @ent, notice: "Ent was successfully updated." }
        format.json { render :show, status: :ok, location: @ent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ents/1 or /ents/1.json
  def destroy
    @ent.destroy
    respond_to do |format|
      format.html { redirect_to ents_url, notice: "Ent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def photos
    check_review(@ent.reviewid)
    
    @last_photo1 = Photo.where(camera: 'vita_1').last
    @last_photo2 = Photo.where(camera: 'vita_2').last
  end

  def timelapses
    check_review(@ent.reviewid)
  end

  def coverage
    check_review(@ent.reviewid)
  end

  def check_review(reviewid)
    if user_signed_in?

    else
      if reviewid == params[:reviewid]
      else
        redirect_to home_index_path
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ent
      @ent = Ent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ent_params
      params.require(:ent).permit(:name, :category, :reviewid)
    end
end
