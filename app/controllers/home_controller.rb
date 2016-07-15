class HomeController < ApplicationController
  def index
    #search the make
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    #debugger

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    Make.create_by_json(json)
  end
end
