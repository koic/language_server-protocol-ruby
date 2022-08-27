module LanguageServer
  module Protocol
    module Interface
      #
      # Client Capabilities for a [DefinitionRequest](#DefinitionRequest).
      #
      class DefinitionClientCapabilities
        def initialize(dynamic_registration: nil, link_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:linkSupport] = link_support if link_support

          @attributes.freeze
        end

        #
        # Whether definition supports dynamic registration.
        #
        # @return [boolean | nil]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # The client supports additional metadata in the form of definition links.
        #
        # @since 3.14.0
        #
        # @return [boolean | nil]
        def link_support
          attributes.fetch(:linkSupport)
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
