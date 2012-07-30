#coding: utf-8

module Wombat
  module Property
    module Locators
      class PropertyContainer < Base
        def locate
          super do
            Hash.new.tap do |h|
              @property.values
                .select { |v| v.is_a?(Wombat::DSL::Property) || v.is_a?(Wombat::DSL::PropertyContainer) }
                .map { |p| Factory.locator_for(p, @context).locate }
                .map { |p| h.merge! p }
            end
          end
        end
      end
    end
  end
end