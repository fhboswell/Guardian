# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
