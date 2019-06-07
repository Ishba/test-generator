class MyServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def copy_service_file
    case file_name
    when 'prismic_service'
      copy_prismic_service_file
    end
  end

  private

  def copy_prismic_service_file
    copy_file 'prismic_service.rb', "app/services/#{file_name}.rb"
  end
end
