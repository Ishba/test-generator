class MyInitializerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def copy_controller_file
    case file_name
    when 'i18n_initializer'
      copy_i18n_initializer_file
    when 'mailjet_initializer'
      copy_mailjet_initializer_file
    when 'sentry_config'
      copy_sentry_config_file
    when 'set_sitemap'
      set_sitemap
    end
  end

  private

  def copy_i18n_initializer_file
    copy_file 'i18n.rb', 'config/initializers/i18n.rb'
  end

  def copy_mailjet_initializer_file
    copy_file 'mailjet.rb', 'config/initializers/mailjet.rb'
  end

  def copy_sentry_config_file
    config = IO.read('lib/generators/my_initializer/templates/sentry_config.rb')
    inject_into_file 'config/application.rb', config, before: /^  end\nend/
  end

  def set_sitemap
    gsub_file 'config/sitemap.rb', "http://www.example.com", '#{ENV[HOST]}'
    inject_into_file 'public/robots.txt', "User-agent: *\nDisallow:\n", after: "# See http://www.robotstxt.org/robotstxt.html for documentation on how to use the robots.txt file\n"
  end
end
