@work = Work.find_by_title("Walden")

def save_chunk(chapter, section, text)
  title = "#{chapter}/#{section}"
  p "save #{title}"
  chunk = Chunk.new(:title => title, :body => text, :work => @work)
  chunk.save!
end

p "create Walden"
text = chapter = ""
section = 0
File.open('script/files/walden.txt', 'r').each do |line|
  if match = line.strip!.match(/^\d+\. (.+)$/)
    if !text.strip.empty?
      save_chunk(chapter, section, text)
    end
    text = ""
    chapter = "#{match[1]}"
    section += 1
    next
  end
  if !line.empty?
    text += " #{line}"
  else
    if !text.empty?
      save_chunk(chapter, section, text)
      section += 1
      text = ""
    end
  end
end
save_chunk(chapter, section, text)
