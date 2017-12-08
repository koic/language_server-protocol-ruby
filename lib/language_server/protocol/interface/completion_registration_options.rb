module LanguageServer
  module Protocol
    module Interface
      class CompletionRegistrationOptions < TextDocumentRegistrationOptions
        def initialize(document_selector:, trigger_characters: nil, resolve_provider: nil)
          @attributes = {}

          @attributes[:triggerCharacters] = trigger_characters if trigger_characters
          @attributes[:resolveProvider] = resolve_provider if resolve_provider

          @attributes.freeze
        end

        #
        # The characters that trigger completion automatically.
        #
        # @return [string[]]
        def trigger_characters
          attributes.fetch(:triggerCharacters)
        end

        #
        # The server provides support to resolve additional
        # information for a completion item.
        #
        # @return [boolean]
        def resolve_provider
          attributes.fetch(:resolveProvider)
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
