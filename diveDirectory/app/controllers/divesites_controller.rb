class DivesitesController < ApplicationController
  include DivesitesHelper
  
  def index
    if params[:location]
      @location = params[:location]

      result = Geocoder.search(params[:location])
      @location = result[0].address
      coords = result[0].coordinates
      # coords = result.coordinates
      # @location = result.address
      # coords = Geocoder.coordinates(params[:location])
      resp = HTTParty.get(generate_url(coords[0],coords[1])).to_json
      data_hash = JSON.parse(resp)
      @site_data = data_hash['sites']
      # check_and_update_db(@site_data)

      @lat = data_hash['request']['loc']['lat']
      @lng = data_hash['request']['loc']['lng']
    end
  end

end

