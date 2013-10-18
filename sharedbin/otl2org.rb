#!/usr/bin/env ruby

=begin rdoc
  Very simple (simplistic) script to convert VimOutliner files to
  Emacs org-mode.
=end

require 'pp'

ARGF.each_line do |line|
  match = /^(\t*)(.*)$/.match(line)
  if match[2].start_with? ': '  # Text lines start with a colon
    puts match[2][2..-1]
  else                          # Everything else is a heading
    puts ('*' * match[1].length) + '* ' + match[2]
  end
end
