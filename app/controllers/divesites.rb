get '/divesites' do

    coords = Geocoder.coordinates(params[:location])
    resp = HTTParty.get(generate_url(coords[0],coords[1])).to_json


  data_hash = JSON.parse(resp)
  @site_data = data_hash['sites']
  check_and_update_db(@site_data)

  @lat = data_hash['request']['loc']['lat']
  @lng = data_hash['request']['loc']['lng']
  erb :index
end

get "/divesites/:source_id" do
  @divesite = DiveSite.find_by(source_id: params[:source_id])
  erb :'divesites/show'
end
