require "ruby_parser"
require "ruby_parser/legacy/ruby_parser_extras"

module RubyParserLegacy
end

class RubyParser
  class LegacyParser < Racc::Parser
    include LegacyRubyParserStuff

    def self.inherited x
      RubyParser::VERSIONS << x
    end

    def self.version
      self.name[/(?:V|Ruby)(\d+)/, 1].to_i
    end
  end
end

require "ruby_parser/legacy/ruby18_parser"
require "ruby_parser/legacy/ruby19_parser"

class RubyParser
  VERSIONS.clear
  class V19 < Ruby19Parser; end
  class V18 < Ruby18Parser; end
end
