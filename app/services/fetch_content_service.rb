require 'open-uri'
require 'kramdown'

class FetchContentService

  def initialize
    config_url = "https://raw.githubusercontent.com/kevcha/setup-reloaded-content/master/steps.yml"
    yaml_content = open(config_url) { |f| f.read }
    @steps = YAML::load(yaml_content)
  end

  def call(os, step)
    os_steps = @steps[os.downcase]
    step_info = os_steps[step]

    return unless step_info.present?

    content = open(step_info['link']) { |f| f.read }
    troubleshooting = (tbs = step_info['troubleshooting']).present? ? open(step_info['troubleshooting']) { |f| f.read } : ''
    tooltips = (tool = step_info['tools']).present? ? open(step_info['tools']) { |f| f.read } : ''
    button = (buttons = step_info['button']).present? ? open(step_info['button']) { |f| f.read } : ''

    {
      title: step_info['name'],
      body: Kramdown::Document.new(content).to_html,
      troubleshooting: Kramdown::Document.new(troubleshooting).to_html,
      tools: tooltips,
      button: button,
      total: os_steps.count
    }
  end

end
