require_relative '../models/url.rb'

get '/' do
	@urls = (Url.all.order(id: :desc)).limit(20)
 	erb :"static/index"
end

post '/urls' do

	@current_url = Url.new( params[:url])
	if @current_url.save
		@url = (Url.all.order(id: :desc)).limit(20).to_json
	else
		@status = false
		@status.to_json
		# @urls = Url.all.to_json
		# erb :"static/index"
	end
end

get '/:short_url'  do
	#redirect user to the original long_url
	url = Url.find_by(short_url: params[:short_url])
	url.add_count
	redirect to "#{url.long_url}"
end
