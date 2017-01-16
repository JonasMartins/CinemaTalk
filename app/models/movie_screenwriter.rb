class MovieScreenwriter < ActiveRecord::Base

	belongs_to :movie
	belongs_to :screenwriter

end