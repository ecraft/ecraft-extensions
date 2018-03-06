#
# Utility mixin for converting arbitrary objects to Hashes.
#
# Similar to https://github.com/mustafaturan/hashable, but different in implementation.
#
# This mixin is deprecated, since it changes the behavior of to_h in a potentially unpleasant and surprising way for developers.
# It should only be used to make legacy code run and work; it should preferably not be used for new code being written.
#

require 'active_support'
require 'active_support/core_ext/hash/keys'

module Ecraft
  module Extensions
    module Mixins
      module Hashable
        def to_h(*targets)
          target = get_target(targets)

          if target.is_a?(Hash)
            strip_string_recurse_enumerable_values(target)
          elsif target.is_a?(Array)
            strip_array(target)
          elsif target.is_a?(OpenStruct)
            target.marshal_dump
          elsif value_type?(target)
            target
          # We need to check to ensure we don't call ourselves recursively.
          elsif !target.class.included_modules.include?(Hashable) && target.respond_to?(:to_h)
            target.to_h
          else
            turn_object_into_hash(target)
          end
        end

        def to_hash(target = nil)
          to_h(target)
        end

        private

        def get_target(targets)
          if targets.empty?
            self
          else
            targets.first
          end
        end

        def value_type?(value)
          value.is_a?(BigDecimal) ||
            value.is_a?(Integer) ||
            value.is_a?(Float) ||
            value.is_a?(String) ||
            value.is_a?(TrueClass) ||
            value.is_a?(FalseClass)
        end

        def strip_string_recurse_enumerable_values(hash)
          hash.each_value do |v|
            v.rstrip! if v.respond_to?(:rstrip!) && !v.frozen?
            to_h(v) if v.is_a?(Enumerable)
          end
          hash.symbolize_keys
        end

        def strip_array(array)
          array.map do |v|
            if v.nil?
              nil
            elsif v.is_a?(String)
              v.rstrip
            elsif v.respond_to?(:to_h) && !v.is_a?(Hash)
              v.to_h
            else
              to_h(v)
            end
          end
        end

        # Returns a Symbol-keyed Hash based on target's instance variables.
        #
        # @param target [Object]
        #
        # @return [Hash] with Symbol keys
        def turn_object_into_hash(target)
          target.instance_variables.each_with_object({}) do |var, hash|
            original = target.instance_variable_get(var)
            value = original

            if value.is_a?(Hash)
              # Nothing to do - it's already a hash, so we presume we don't have to do do any more conversions of it.
            elsif value.is_a?(Array) && value.first.is_a?(Hash)
              # Nothing to do - an Array of Hashes already have a sane enough format.
            else
              map_enumerable(original) if original.respond_to?(:each)
              value = original.to_h if original.respond_to?(:to_h)
              value.rstrip! if value.respond_to?(:rstrip!) && !value.frozen?
            end

            hash[var.to_s.delete('@').to_sym] = value
          end
        end

        def map_enumerable(enumerable)
          enumerable.map do |v|
            v.respond_to?(:to_h) ? v.to_h : v
          end
        end
      end
    end
  end
end
