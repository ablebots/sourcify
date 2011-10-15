require 'rubygems'
require File.expand_path('../../lib/sourcify', __FILE__)

# /////////////////////////////////////////////////////
# Bacon
# /////////////////////////////////////////////////////
require 'bacon'
Bacon.extend(Bacon::TestUnitOutput)
Bacon.summary_on_exit

# /////////////////////////////////////////////////////
# Matchers
# /////////////////////////////////////////////////////
def having_source(source)
  # NOTE: We ignore code indentation while doing checks
  lines = source.strip.split("\n").map { |s| s.sub(/^\s*/, '') }
  expected = %r(^#{lines.join("\n\s*")}$)

  lambda { |thing| thing.to_source =~ expected }
end

