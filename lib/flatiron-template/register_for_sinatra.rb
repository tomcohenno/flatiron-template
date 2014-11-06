require 'flatiron-template/register_for_sinatra'

module Sinatra
  module Templates  
    def flat(template, options = {}, locals = {}, &block)
      render(:flat, template, options, locals, &block)
    end
  end
end