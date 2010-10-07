module InterrogatorHelper
  def formatted_answer(answer)
    answer.gsub!("\n\n", "<br /<br />")
    @matches = answer.scan(/([A-Z]{2,})/).flatten
    @matches += answer.scan(/_.+?_/m).flatten
    @matches.each { |m| answer.sub!(m, "<em>#{m.downcase}</em>") }
    @matches = answer.scan(/\*.+?\*/).flatten
    @matches.each { |m| answer.sub!(m, "<strong>#{m}</strong>") }
    answer.strip!
    answer.sub!(/^\d+\.? ?/, "")
    answer.gsub(/[_*]/, "")
  end
end
