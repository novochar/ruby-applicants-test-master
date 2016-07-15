class HomeController < ApplicationController
  def index
    #search the make
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    #debugger

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      Make.transaction do
        if not Make.exists?(name: make_params["Nome"]) 
          Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
        end
      end
    end
  end
end
