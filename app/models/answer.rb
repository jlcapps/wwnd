class Answer
  @@tag_pattern = /<\/?span.*?>/

  attr_accessor :body, :snippet
  def initialize(body, snippet)
    @body, @snippet = body, snippet
  end

  def to_s
    snip_arr = @snippet.split("&#8230;").reject { |s| s.strip!.empty? }
    first = Regexp.escape(snip_arr.first.gsub(@@tag_pattern, ""))
    last =  Regexp.escape(snip_arr.last.gsub(@@tag_pattern, ""))
    snip_pattern = /(.+[.?!])?(.*#{first}.*#{last}[^.?!]*[.?!]["']?)/m
    if match = @body.match(snip_pattern)
      match[2]
    else
      ActiveRecord::Base.logger.debug "Failed Answer match!"
      ActiveRecord::Base.logger.debug "Body: #{@body}"
      ActiveRecord::Base.logger.debug "snippet: #{@snippet}"
      ActiveRecord::Base.logger.debug "snip_pattern: #{snip_pattern}"
      @body
    end
  end
end
