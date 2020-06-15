require "poly_press/version"

# # require 'i18n'
require 'dry-struct'
require 'dry/validation'
require 'dry/monads'
require 'dry/monads/result'
require 'dry/monads/do'

require 'poly_press/types'

require 'poly_press/resource'
require 'poly_press/composition'
require 'poly_press/document'
require 'poly_press/option'
require 'poly_press/template'
require 'poly_press/formatters'

require 'poly_press/serializers/base_struct'
require 'poly_press/serializers/excel'


module PolyPress

#   I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
#   I18n.default_locale = :en

  class Error < StandardError; end
#   # Your code goes here...
end
