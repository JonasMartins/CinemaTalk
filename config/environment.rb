# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Resolvendo problema do Uploader
require 'carrierwave/orm/activerecord'

# acabando com field_with_erros
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end