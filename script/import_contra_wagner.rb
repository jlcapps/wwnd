@work = Work.find_by_title("Nietzsche Contra Wagner")

def save_chunk(chapter, section, text)
  title = "#{[chapter, section].reject { |n| n.empty? }.join("/")}"
  p "save #{title}"
  chunk = Chunk.new(:title => title, :body => text, :work => @work)
  chunk.save!
end

p "create Nietzsche Contra Wagner"
text = chapter = section = ""
File.open('script/files/contra_wagner.txt', 'r').each do |line|
  if match = line.strip!.match(/(^[A-Z ]{2,})\.?\z/)
    if !text.strip.empty?
      save_chunk(chapter, section, text)
    end
    text = section = ""
    chapter = "#{match[1].downcase.titlecase}"
    next
  end
  if !line.empty?
    if secno = line.match(/^(\d+)\.$/)
      if !text.strip.empty?
        save_chunk(chapter, section, text)
      end
      section = "Section #{secno[1]}"
      text = ""
    end
    text += " #{line}"
  else
    text += "\n\n"
  end
end
save_chunk(chapter, section, text)
