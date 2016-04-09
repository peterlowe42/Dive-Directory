class DivesitesController < ApplicationController
  include DivesitesHelper
  
  def index
    if params[:location]
      result = Geocoder.search(params[:location])
      location = result[0].address
      coords = result[0].coordinates
      resp = HTTParty.get(generate_url(coords[0],coords[1])).to_json
      data_hash = JSON.parse(resp)
      site_data = data_hash['sites']
      @lat = data_hash['request']['loc']['lat']
      @lng = data_hash['request']['loc']['lng']
      @location = check_and_update_db(site_data, location, @lat, @lng)
      @hash = Gmaps4rails.build_markers(@location.divesites) do |site, marker|
        marker.lat site.lat
        marker.lng site.lng
      end

    end
  end

  def show
    @divesite = Divesite.find_by(id: params[:id])
     @hash = Gmaps4rails.build_markers(@divesite) do |site, marker|
        marker.lat site.lat
        marker.lng site.lng
      end
  end

end

