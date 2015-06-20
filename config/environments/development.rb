# -*- coding: utf-8  -*-
Zone::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

#  config.action_mailer.default_url_options = {host: 'localhost', port: 3000 }
  # mail config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  #config.action_mailer.perform_deliveries = true
  
  config.action_mailer.smtp_settings = {
    :address        => "smtp.gmail.com", # SMTPサーバのホスト名
    :port           => 587,                 # SMTPサーバに接続するポート
    :authentication => :plain,               # 認証が必要なサーバの場合、特定の認証方式をここで指定
    :user_name      => ENV["SMTP_MAIL"],      # ユーザ名
    :password       => ENV["SMTP_PASS"],   # パスワード
    :enable_starttls_auto => true
  }

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
 # config.action_mailer.raise_deliver_errors = false #0614 comment out

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
