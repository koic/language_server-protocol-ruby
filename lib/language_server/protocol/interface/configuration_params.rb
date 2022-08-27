module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a configuration request.
      #
      class ConfigurationParams
        def initialize(items:)
          @attributes = {}

          @attributes[:items] = items

          @attributes.freeze
        end

        # @return [ConfigurationItem[]]
        def items
          attributes.fetch(:items)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
