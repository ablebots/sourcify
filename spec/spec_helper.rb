require 'rubygems'
require File.expand_path('../../lib/sourcify', __FILE__)

# Bacon
require 'bacon'
Bacon.extend(Bacon::TestUnitOutput)
Bacon.summary_on_exit
