Sourcify.require_rb('common', 'parser', 'raw_scanner', 'extensions')

module Sourcify
  module Method
    class Parser
      module RawScanner #:nodoc:all
        module Extensions

          include Common::Parser::RawScanner::Extensions
          Counter = Common::Parser::RawScanner::Counter

          def increment_lineno
            stop_if_probably_defined_by_proc
            super
          end

          def stop_if_probably_defined_by_proc
            raise ProbablyDefinedByProc if @lineno == 1 && @results.empty? && !@counter.started?
          end

          def increment_counter(count = 1)
            unless @counter.started?
              return if (@rejecting_block = codified_tokens !~ @start_pattern)
              offset_attributes
            end
            @counter.increment(count)
          end

          def decrement_counter
            @counter.decrement
            construct_result_code if @counter.balanced?
          end

          def construct_result_code
            code = codified_tokens.strip

            begin
              if valid?(code) && @body_matcher.call(code)
                # NOTE: Need to fix singleton method to avoid errors (eg. undefined object)
                # downstream
                @results << code.sub(%r{^(def\s+)(?:[^\.]+\.)?(#{@name}.*end)$}m, '\1\2')
                raise Escape if @stop_on_newline or @lineno != 1
                reset_attributes
              end
            rescue Exception
              raise if $!.is_a?(Escape)
            end
          end

          def reset_attributes
            @counter = Counter.new
            super
          end

          def valid?(*args)
            # TODO: shouldn't need this check, there seems to be a bug w raw_scanner.rl.
            args[0].start_with?('def') && super
          end

        end
      end
    end
  end
end
