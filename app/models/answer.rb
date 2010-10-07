class Answer

  attr_accessor :body, :snippet, :snip_pattern
  def initialize(body, snippet)
    @body, @snippet = body, snippet

    # build a match pattern based on Sphinx excerpts markup
    tag_pattern = /<\/?span.*?>/
    snip_arr = @snippet.split("&#8230;").reject { |s| s.strip!.empty? }
    first = Regexp.escape(snip_arr.first.gsub(tag_pattern, ""))
    last =  Regexp.escape(snip_arr.last.gsub(tag_pattern, ""))
    @snip_pattern = if first == last
      /(.+[.?!]["']?)?(.*#{first}[^.?!]*[.?!]?["']?)/m
    else
      /(.+[.?!])?(.*#{first}.*#{last}[^.?!]*[.?!]?["']?)/m
    end
  end

  def to_s
    # pull quote from body of chunk
    @quote ||= if match = @body.match(@snip_pattern)
                 match[2]
               else
                 msg = ["Failed Answer match!","body: #{@body}", 
                        "snippet: #{@snippet}", 
                        "snip_pattern: #{@snip_pattern}"].join("\n")
                 ActiveRecord::Base.logger.debug msg
                 @body
               end
  end
end
