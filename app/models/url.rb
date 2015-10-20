class Url < ActiveRecord::Base
	before_create :shorten

	# def initialize(data={})
	# 	@long_url = data.fetch(long_url)
	# 	@short_url
	# end

	def shorten
		self.short_url = (('a'..'z').to_a.shuffle[0,6]+(0..9).to_a.shuffle[0,2]).shuffle.join
	end

end

