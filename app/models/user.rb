class User < ActiveRecord::Base

belongs_to :user_level

has_many :comments
has_many :reviews


# Validations
validates :user_level_id, presence: true
validates :birth_date, presence: true
validates :birth_name, presence: true, length: {minimum: 5}
validates :nickname, presence: true, length: {minimum: 5}
validates :hometown, presence: true
validates :country, presence: true

end

=begin

Dicas para validations: http://guides.rubyonrails.org/active_record_validations.html

confirmação de password:  


class Person < ApplicationRecord
  validates :email, confirmation: true
end

<%= text_field :person, :email %>
<%= text_field :person, :email_confirmation %>

=end