#!/usr/bin/env ruby
class WWFCheater
  attr_reader :dictionary
  def initialize(dictionary = File.dirname(__FILE__) + "/lib/words.txt")
    @dictionary = dictionary
  end
  def match?(word, tiles)
    w = word.split(//)
    t = tiles.split(//)
    w == w.select { |l| t.delete l }
  end
  def matches(tiles)
    File.readlines(dictionary).select { |w| match?(w.rstrip, tiles) }
  end
end

if __FILE__ == $0
  puts "Finding matches for " + ARGV[0]
  cheater = WWFCheater.new
  puts "Using " + cheater.dictionary
  cheater.matches(ARGV[0]).each { |w| puts w }
end
