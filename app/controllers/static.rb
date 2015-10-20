require_relative '../models/url.rb'

get '/' do
	@urls = Url.all
 	erb :"static/index"
end

post '/urls' do
	Url.new(long_url: params[:long_url]).save
	@urls = Url.all
	redirect to '/'
	# erb :"static/index"
end

get '/:short_url'  do
	#redirect user to the original url
	url = Url.find_by(short_url: params[:short_url])
	redirect to "#{url.long_url}" 
end