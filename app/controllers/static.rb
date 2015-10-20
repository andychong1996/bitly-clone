require_relative '../models/url.rb'

get '/' do
	@urls = Url.all
 	erb :"static/index"
end

post '/urls' do
	
	Url.new(long_url: params[:url][:long]).save
	redirect to '/'
	# erb :"static/index"
end

get '/:short_url'  do
	#redirect user to the original long_url
	url = Url.find_by(short_url: params[:short_url])
	redirect to "#{url.long_url}" 
end