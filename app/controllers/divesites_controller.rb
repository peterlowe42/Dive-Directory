class DivesitesController < ApplicationController
  include DivesitesHelper
  
  def index
    if params[:location]
      result = Geocoder.search(params[:location])
      if result[0]
        location = result[0].address
        coords = result[0].coordinates
        resp = HTTParty.get(generate_url(coords[0],coords[1])).to_json
        data_hash = JSON.parse(resp)
        site_data = data_hash['sites']
        @location = check_and_update_db(site_data, location, @lat, @lng)
        @divesites = @location.divesites
        @hash = Gmaps4rails.build_markers(@divesites) do |site, marker|
          marker.lat site.lat
          marker.lng site.lng
          marker.infowindow site.site_name
        end
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
    end
  end

end

