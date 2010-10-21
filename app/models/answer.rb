class Answer

  attr_accessor :body, :snippet
  def initialize(body, snippet)
    @body, @snippet = body, snippet
  end

  def to_s
    # pull quote from body of chunk
    @quote ||= if match = @body.match(snip_pattern)
                 match[2]
               else
                 msg = ["Failed Answer match!","body: #{@body}", 
                        "snippet: #{@snippet}", 
                        "snip_pattern: #{snip_pattern}"].join("\n")
                 ActiveRecord::Base.logger.debug msg
                 @body
               end
  end

protected

  def anchor
    @snippet.split("&#8230;").reject { |s| s.strip!.empty? }.
      values_at(0, -1).
      uniq.
      collect { |s| Regexp.escape(s) }.
      join(".*")
  end

  def snip_pattern
    /(.+[.?!]\)?["']?\s+)?(['"]?[A-Z]?.*#{anchor}[^.?!]*[.?!]?["']?)/m
  end
end
