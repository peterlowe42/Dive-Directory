helpers do
#http://api.divesites.com/?mode=sites&lat=47.6031537682643&lng=-122.336164712906&dist=25
  def generate_url(lat,long)
    return "http://api.divesites.com/?mode=sites&lat=#{lat}&lng=#{long}&dist=25"
  end

  def check_and_update_db(site_data)
  end
end
