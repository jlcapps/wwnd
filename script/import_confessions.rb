@work = Work.find_by_title("The Confessions")

def save_chunk(book, paragraph, text)
  if @work.nil?
    p "Can't find the Work!"
  end
  title = "#{book} p.#{paragraph}"
  p "save #{title}"
  chunk = Chunk.new(:title => title, :body => text, :work => @work)
  chunk.save!
end

p "create The Confessions"
text = book = ""
paragraph = 0
File.open('script/files/confessions.txt', 'r').each do |l|
  line = l.strip
  if match = line.match(/^BOOK ([IVX]+)\z/)
    if !text.strip.empty?
      save_chunk(book, paragraph, text)
    end
    text = book = ""
    paragraph = 1
    book = "Book #{match[1]}"
    next
  end
  if !line.empty?
    text += " #{line}"
  else
    if !text.strip.empty?
      save_chunk(book, paragraph, text)
      text = ""
      paragraph += 1
    end
  end
end
save_chunk(book, paragraph, text)
