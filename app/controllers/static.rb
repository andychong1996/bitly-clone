require_relative '../models/url.rb'

get '/' do
	@urls = Url.all.order(:id)
 	erb :"static/index"
end

post '/urls' do

	@current_url = Url.new(long_url: params[:url][:long])

	if @current_url.save
		redirect to '/'
	elsif @current_url.errors.messages
		@urls = Url.all
		erb :"static/index"
	else
		@current_url.save
		redirect to '/'
	end
end

get '/:short_url'  do
	#redirect user to the original long_url
	url = Url.find_by(short_url: params[:short_url])
	url.add_count
	redirect to "#{url.long_url}"
end
