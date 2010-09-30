module InterrogatorHelper
  def formatted_answer(answer)
    answer.gsub!("\n\n", "<br /<br />")
    @matches = answer.scan(/([A-Z]{2,})/).flatten
    @matches.each { |m| answer.sub!(m, "<i>#{m.downcase}</i>") }
    answer
  end
end
