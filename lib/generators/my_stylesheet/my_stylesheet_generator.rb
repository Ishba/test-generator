class MyStylesheetGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def copy_controller_file
    case file_name
    when 'base_stylesheet'
      copy_base_stylesheet_file
    when 'header_footer_sass'
      copy_header_footer_sass
    when 'testimonials_sass'
      copy_testimonials_sass
    end
  end

  private

  def copy_base_stylesheet_file
    remove_file 'app/assets/stylesheets/application.css'
    copy_file 'application.sass', 'app/assets/stylesheets/application.sass'
    copy_file 'base.sass', 'app/assets/stylesheets/_base.sass'
    copy_file 'variables.sass', 'app/assets/stylesheets/_variables.sass'
  end

  def copy_header_footer_sass
    copy_file 'header.sass', 'app/assets/stylesheets/_header.sass'
    copy_file 'footer.sass', 'app/assets/stylesheets/_footer.sass'
  end

  def copy_testimonials_sass
    copy_file 'testimonials.sass', 'app/assets/stylesheets/_testimonials.sass'
  end
end
