class User < ActiveRecord::Base

belongs_to :user_level

has_many :comments
has_many :reviews
has_many :grades

before_save { self.email = email.downcase }

# Validations
validates :user_level_id, presence: true
validates :birth_date, presence: true
validates :birth_name, presence: true, length: {minimum: 5}
validates :nickname, presence: true, length: {minimum: 5}
validates :hometown, presence: true
validates :country, presence: true

#found at: http://emailregex.com/
VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :email, presence: true, length: 
{maximum: 105},uniqueness: {case_sensitive: false}, 
format: {with: VALID_EMAIL_REGEX}

has_secure_password
validates :password_digest, presence: true, length: { minimum: 8 }
validates_confirmation_of :password


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