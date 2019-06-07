class MyJavascriptGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def copy_controller_file
    case file_name
    when 'header_mobile'
      copy_script_header_mobile
    when 'jquery_install'
      setup_jquery
    when 'segment_install'
      setup_segment
    end
  end

  private

  def copy_script_header_mobile
    copy_file 'mobile_nav.js', 'app/assets/javascripts/mobile_nav.js'
  end

  def setup_jquery
    inject_into_file 'app/assets/javascripts/application.js', "//= require jquery\n", before: "//= require rails-ujs\n"
  end

  def setup_segment
    create_file 'app/assets/javascripts/segment.js'
    inject_into_file 'app/assets/javascripts/segment.js', "// Paste segment script here\n", after: ''
    inject_into_file 'app/assets/javascripts/application.js', "//= require segment\n", before: "//= require rails-ujs\n"
  end
end
