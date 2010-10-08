@work = Work.find_by_title("An Essay Concerning Humane Understanding")
if @work.nil?
  p "Can't find Work!"
end

def save_chunk(book, chapter, section, text)
  title = "#{[book, chapter, section].reject { |n| n.empty? }.join("/")}"
  p "save #{title}"
  chunk = Chunk.new(:title => title, :body => text, :work => @work)
  chunk.save!
end

p "An Essay Concerning Humane Understanding"
text = book = chapter = section = ""
File.open('script/files/humane_understanding.txt', 'r').each do |l|
  line = l.strip!
  if match = line.match(/^BOOK ([IVX]+)$/)
    if !text.strip.empty?
      save_chunk(book, chapter, section, text)
    end
    book = "Book #{match[1]}"
    text = chapter = section = ""
    next
  end
  if match = line.match(/(^[A-Z ]{2,})\z/)
    book += " #{match[1].downcase.titlecase}"
    next
  end
  if match = line.match(/CHAPTER ([IVXLMC]+)\.\z/)
    if !text.strip.empty?
      save_chunk(book, chapter, section, text)
    end
    chapter = "Chapter #{match[1]}"
    text = section = ""
    next
  end
  if match = line.match(/(^[A-Z\,\;\-\: ]{2,})\.?\z/)
    chapter += " #{match[1].downcase.titlecase}"
    next
  end
  if match = line.match(/^(\d+)\. \w/)
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
