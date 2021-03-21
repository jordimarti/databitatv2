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
    
    resposta = HTTParty.get("https://my.tikee.io/v2/photo_sets/b5c0711e-b6f1-4d91-aa2d-55db20b47eec/last_signed_url", headers: { 
      "Accept" => "application/json" })
    dades = resposta.to_hash
    @image_url = dades['url']['url']['original']
    @image_date = dades['url']['date']
    resposta2 = HTTParty.get("https://my.tikee.io/v2/photo_sets/02a65610-6e86-4917-acd1-084415428d92/last_signed_url", headers: { 
      "Accept" => "application/json" })
    dades2 = resposta2.to_hash
    @image2_url = dades2['url']['url']['original']
    @image2_date = dades2['url']['date']

    @last_photo = Photo.last

    #@photos_0 = Photo.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    #@photos_1 = Photo.where(created_at: 1.days.ago.to_date.beginning_of_day..1.days.ago.to_date.end_of_day)
    #@photos_2 = Photo.where(created_at: 2.days.ago.to_date.beginning_of_day..2.days.ago.to_date.end_of_day)
    #@photos_3 = Photo.where(created_at: 3.days.ago.to_date.beginning_of_day..3.days.ago.to_date.end_of_day)
    #@photos_4 = Photo.where(created_at: 4.days.ago.to_date.beginning_of_day..4.days.ago.to_date.end_of_day)
    #@photos_5 = Photo.where(created_at: 5.days.ago.to_date.beginning_of_day..5.days.ago.to_date.end_of_day)
    #@photos_6 = Photo.where(created_at: 6.days.ago.to_date.beginning_of_day..6.days.ago.to_date.end_of_day)
    #@photos_7 = Photo.where(created_at: 7.days.ago.to_date.beginning_of_day..7.days.ago.to_date.end_of_day)
    #@photos_8 = Photo.where(created_at: 8.days.ago.to_date.beginning_of_day..8.days.ago.to_date.end_of_day)
    #@photos_9 = Photo.where(created_at: 9.days.ago.to_date.beginning_of_day..9.days.ago.to_date.end_of_day)
    #@photos_10 = Photo.where(created_at: 10.days.ago.to_date.beginning_of_day..10.days.ago.to_date.end_of_day)
    
    if params.has_key?(:date)
      date = Date.parse(params[:date])
    else
      date = Date.today
    end
    @photos_vita_1 = Photo.where(created_at: date.beginning_of_day..date.end_of_day, camera: "vita_1")
    @photos_vita_2 = Photo.where(created_at: date.beginning_of_day..date.end_of_day, camera: "vita_2")

    @last_10_days = (10.days.ago.to_date..Date.today).map{ |date| date.strftime("%F") }
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
