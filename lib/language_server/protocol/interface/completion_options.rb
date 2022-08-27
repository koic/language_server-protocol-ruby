module LanguageServer
  module Protocol
    module Interface
      #
      # Completion options.
      #
      class CompletionOptions
        def initialize(trigger_characters: nil, all_commit_characters: nil, resolve_provider: nil, completion_item: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:triggerCharacters] = trigger_characters if trigger_characters
          @attributes[:allCommitCharacters] = all_commit_characters if all_commit_characters
          @attributes[:resolveProvider] = resolve_provider if resolve_provider
          @attributes[:completionItem] = completion_item if completion_item
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # Most tools trigger completion request automatically without explicitly requesting
        # it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
        # starts to type an identifier. For example if the user types `c` in a JavaScript file
        # code complete will automatically pop up present `console` besides others as a
        # completion item. Characters that make up identifiers don't need to be listed here.
        #
        # If code complete should automatically be trigger on characters not being valid inside
        # an identifier (for example `.` in JavaScript) list them in `triggerCharacters`.
        #
        # @return [string[] | nil]
        def trigger_characters
          attributes.fetch(:triggerCharacters)
        end

        #
        # The list of all possible characters that commit a completion. This field can be used
        # if clients don't support individual commit characters per completion item. See
        # `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
        #
        # If a server provides both `allCommitCharacters` and commit characters on an individual
        # completion item the ones on the completion item win.
        #
        # @since 3.2.0
        #
        # @return [string[] | nil]
        def all_commit_characters
          attributes.fetch(:allCommitCharacters)
        end

        #
        # The server provides support to resolve additional
        # information for a completion item.
        #
        # @return [boolean | nil]
        def resolve_provider
          attributes.fetch(:resolveProvider)
        end

        #
        # The server supports the following `CompletionItem` specific
        # capabilities.
        #
        # @since 3.17.0
        #
        # @return [{ labelDetailsSupport:boolean } | nil]
        def completion_item
          attributes.fetch(:completionItem)
        end

        # @return [boolean | nil]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
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
