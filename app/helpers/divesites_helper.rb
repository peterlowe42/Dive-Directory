module DivesitesHelper

  def generate_url(lat,long)
    return "http://api.divesites.com/?mode=sites&lat=#{lat}&lng=#{long}&dist=25"
  end

  def check_and_update_db(site_data, location, lat, lng)
    if loc = Location.where(name: location)[0]
      return loc
    else loc == nil
      loc = Location.create(name: location, lat: lat, lng: lng)
      site_data.each do |site|
        dive_site = Divesite.where(source_id:site['id'])[0]
        if dive_site == nil
          new_site = Divesite.create(site_name:site['name'], lng:site['lng'], lat:site['lat'], source_id:site['id'])
          loc.divesites << new_site
        else
          loc.divesites << dive_site
        end
      end
      return loc
    end
  end
end
