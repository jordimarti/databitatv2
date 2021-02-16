class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def index2
    resposta = HTTParty.get("https://my.tikee.io/v2/photo_sets/b5c0711e-b6f1-4d91-aa2d-55db20b47eec/last_signed_url", headers: { 
      "Accept" => "application/json" })
    dades = resposta.to_hash
    @image_url = dades['url']['url']['original']
    @image_date = dades['url']['date']
  end
end
