# frozen_string_literal: true

#
# 29: Domain Specific Language
#
# BRIEF:
#
#   Build simple DSL class (EG: 'arbe' gem like)
#
# EXAMPLE:
#
#   html = Arbre::Context.new do
#     h2 'Why is Arbre awesome?'
#
#     ul id: 'nav', class: 'list-squahtml_content' do
#       li 'The DOM is implemented in ruby'
#       li 'You can create object oriented views'
#       li 'Templates suck'
#     end
#
#     p 'Some paragraph.'
#   end
#
#   puts html.render
#
#   <h2>Why is Arbre awesome?</h2>
#   <ul id='nav' class='list-squahtml_content'>
#     <li>The DOM is implemented in ruby</li>
#     <li>You can create object oriented views</li>
#     <li>Templates suck</li>
#   </ul>
#   <p>Some paragraph.</p>
#

module Arbre
  class Context
    SUPPORTED_TAGS = %w(
      h2 p ul li
    ).freeze

    def initialize(&block)
      @html_content = []

      instance_eval(&block)
    end

    def render
      @html_content.join("")
    end

    private

    def method_missing(method_name, *args, &block)
      if supported_tag?(method_name)
        generate_html(method_name, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      supported_tag?(method_name) || super
    end

    def p(*args, &block)
      generate_html('p', *args, &block)
    end

    def supported_tag?(tag_name)
      SUPPORTED_TAGS.include?(tag_name.to_s)
    end

    def generate_html(method_name, *args, &block)
      @html_content << "<#{method_name}#{html_properties(*args)}>"

      if block_given?
        instance_eval(&block)
      else
        @html_content << args.last
      end

      @html_content << "</#{method_name}>"
    end

    def html_properties(*args)
      return '' unless args.first.is_a?(Hash)

      res = args.first.map do |k, v|
        "#{k}='#{v}'"
      end.join(' ')

      " #{res}"
    end
  end
end
