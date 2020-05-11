require "poly_press/version"

require 'dry-struct'
require 'dry/validation'
require 'dry/monads'
require 'dry/monads/result'
require 'dry/monads/do'

require 'poly_press/attachment'
require 'poly_press/composition'
require 'poly_press/document'
require 'poly_press/option'
require 'poly_press/template'



module PolyPress
  class Error < StandardError; end
  # Your code goes here...
end
