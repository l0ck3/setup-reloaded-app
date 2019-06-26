require 'open-uri'
require 'kramdown'

class FetchContentService

  def initialize
    config_url = "https://raw.githubusercontent.com/kevcha/setup-reloaded-content/master/steps.yml"
    yaml_content = open(config_url) { |f| f.read }
    @steps = YAML::load(yaml_content)
  end

  def call(os, step)
    step_info = @steps[os.downcase][step]

    return unless step_info.present?

    content = open(step_info['link']) { |f| f.read }

    {
      title: step_info['title'],
      body: Kramdown::Document.new(content).to_html
    }
  end

end
