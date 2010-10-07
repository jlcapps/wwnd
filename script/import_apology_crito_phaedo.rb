def save_chunk(section, text)
  p "save #{section}"
  chunk = Chunk.new(:title => section, :body => text, :work => @work)
  chunk.save!
end

works = [["The Apology of Socrates", "apology_of_socrates.txt"],
         ["Crito; or, the Duty of a Citizen", "crito.txt"],
         ["Phaedo; or, the Immortality of the Soul", "phaedo.txt"]]

works.each do |title, fname|
  @work = Work.find_by_title(title)
  if @work.nil?
    p "couldn't find "#{title}"
    next
  end
  p "create #{title}"
  text = section = ""
  File.open("script/files/#{fname}", 'r').each do |line|
    if match = line.strip!.match(/^(\d+)\./)
      if !text.strip.empty?
        save_chunk(section, text)
      end
      section = "Section #{match[1]}"
      text = "#{line}"
      next
    end
    if !section.empty?
      if !line.empty?
        text += " #{line}"
      else
        text += "\n\n"
      end
    end
  end
  save_chunk(section, text)
end
