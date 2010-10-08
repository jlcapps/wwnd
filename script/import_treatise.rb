@work = Work.find_by_title("Second Treatise of Government")

def save_chunk(book, chapter, section, text)
  title = "#{[book, chapter, section].reject { |n| n.empty? }.join("/")}"
  p "save #{title}"
  chunk = Chunk.new(:title => title, :body => text, :work => @work)
  chunk.save!
end

p "create Second Treatise of Government"
text = book = chapter = section = ""
File.open('script/files/treatise1.txt', 'r').each do |l|
  line = l.strip!
  if match = line.match(/^Book [IVX]+$/)
    if !text.strip.empty?
      save_chunk(book, chapter, section, text)
    end
    book = match[0]
    text = chapter = section = ""
    next
  end
  if match = line.match(/CHAPTER\. ([IVXLMC]+)\.\z/)
    if !text.strip.empty?
      save_chunk(book, chapter, section, text)
    end
    chapter = "Chapter #{match[1]}"
    text = section = ""
    next
  end
  if match = line.match(/(^[A-Z ]{2,})\.?\z/)
    chapter += " #{match[1].downcase.titlecase}"
    next
  end
  if match = line.match(/^Sect\. (\d+)\./)
    if !text.strip.empty?
      save_chunk(book, chapter, section, text)
    end
    section = "Section #{match[1]}"
    text = line
    next
  end
  if !line.empty?
    text += " #{line}"
  else
    text += "\n\n"
  end
end
save_chunk(book, chapter, section, text)
