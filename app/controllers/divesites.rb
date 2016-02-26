get '/divesites' do
  if (params[:lat] && params[:long])
    resp = HTTParty.get(generate_url(params[:lat],params[:long])).to_json
    @location = "#{params[:lat].to_s}, #{params[:long].to_s}"
    p @location
  else
    resp = HTTParty.get('http://api.divesites.com').to_json
  end
  site_hash = JSON.parse(resp)
  @site_data = site_hash['sites']

    erb :sites

end
