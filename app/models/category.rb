class Category < ActiveRecord::Base

has_many :movies # uma categoria tem muitos filmes
end