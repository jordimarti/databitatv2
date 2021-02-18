class EntsController < ApplicationController
  before_action :set_ent, only: %i[ show edit update destroy photos ]
  before_action :authenticate_user!, except: %i[photos]

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
    if user_signed_in?

    else
      if @ent.reviewid == params[:reviewid]
      else
        redirect_to home_index_path
      end
    end
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
