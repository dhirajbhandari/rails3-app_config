require 'app_config'


  class Application
    class << self
      def app_config
        @app_config_local ||= AppConfig.new(YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env])
      end
    end
  end


#example usage:
if Application.app_config.mailer_config && Application.app_config.mailer_config.host
  Rails::Application.config.action_mailer.default_url_options = {:host => Application.app_config.mailer_config.host}
end
