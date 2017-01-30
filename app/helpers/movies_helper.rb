module MoviesHelper
	regions = File.read("#{Rails.root}/db/database_json/regions.json")
	@regions_json = JSON.parse(regions)

	decades = File.read("#{Rails.root}/db/database_json/decades.json")
	@decades_json = JSON.parse(decades)

	categories = File.read("#{Rails.root}/db/database_json/categories.json")
	@categories_json = JSON.parse(categories)

	def self.get_regions
		return @regions_json
	end
	def self.get_decades
		return @decades_json
	end
	def self.get_categories
		return @categories_json
	end
end
