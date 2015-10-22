class Url < ActiveRecord::Base
	before_create :shorten

	validates :long_url, presence: true
	validates :long_url, format: { with: URI.regexp }
	validates :short_url, uniqueness: true

	def shorten
		self.short_url = (('a'..'z').to_a.shuffle[0,6]+(0..9).to_a.shuffle[0,2]).shuffle.join
	end

	def add_count
			self.increment!(:click_count, 1)
	end

end

