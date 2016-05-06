class DivesitesController < ApplicationController
  include DivesitesHelper
  
  def index
    if params[:location]
      geo_data = Geocoder.search(params[:location])
      if geo_data[0]
        get_divesites(geo_data)
        build_marker_hash
      else
        flash[:error] = "Sorry we could not find that location"
      end
    end
  end

  def show
    @divesite = Divesite.find_by(id: params[:id])
    @hash = Gmaps4rails.build_markers(@divesite) do |site, marker|
      marker.lat site.lat
      marker.lng site.lng
      marker.infowindow site.site_name
    end
  end

  private

  def get_divesites(geo_data)
    location = geo_data[0].address
    coords = geo_data[0].coordinates
    resp = HTTParty.get(generate_url(coords[0],coords[1])).to_json
    data_hash = JSON.parse(resp)
    @location = check_and_update_db(data_hash['sites'], location, @lat, @lng)
    @divesites = @location.divesites
  end 

  def build_marker_hash
    @hash = Gmaps4rails.build_markers(@divesites) do |site, marker|
      marker.lat site.lat
      marker.lng site.lng
      marker.infowindow site.site_name
    end
  end

end

