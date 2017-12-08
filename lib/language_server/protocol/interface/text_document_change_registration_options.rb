module LanguageServer
  module Protocol
    module Interface
      #
      # Descibe options to be used when registered for text document change events.
      #
      class TextDocumentChangeRegistrationOptions < TextDocumentRegistrationOptions
        def initialize(document_selector:, sync_kind:)
          @attributes = {}

          @attributes[:syncKind] = sync_kind

          @attributes.freeze
        end

        #
        # How documents are synced to the server. See TextDocumentSyncKind.Full
        # and TextDocumentSyncKindIncremental.
        #
        # @return [number]
        def sync_kind
          attributes.fetch(:syncKind)
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
