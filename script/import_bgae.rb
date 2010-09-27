@work = Work.find_by_title("Beyond Good and Evil")

def save_chunk(chapter, section, text)
  title = "#{[chapter, section].reject { |n| n.empty? }.join("/")}"
  p "save #{title}"
  chunk = Chunk.new(:title => title, :body => text, :work => @work)
  chunk.save!
end

p "create Beyond Good and Evil"
text = chapter = section = ""
File.open('script/files/beyond_good_and_evil.txt', 'r').each do |line|
  if line.strip! == "PREFACE"
    chapter = "Preface"
    text = section = ""
    next
  end
  if match = line.match(/(CHAPTER) ([IVCMLX]+)\. (.+)\z/)
    if !text.strip.empty?
      save_chunk(chapter, section, text)
    end
    text = section = ""
    chapter = "Chapter #{match[2]} - #{match[3].downcase.titlecase}"
    next
  end
  if !chapter.empty?
    if !line.empty?
      if secno = line.match(/(\d+)\./)
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
end
save_chunk(chapter, section, text)

p "create From the Heights"
stanza = text = ""
File.open('script/files/from_the_heights.txt', 'r').each do |line|
  if match = line.match(/(\d+)\./)
    if !stanza.strip.empty?
      save_chunk("From the Heights", "Stanza #{stanza}", text)
    end
    stanza = match[1]
    text = ""
  else
    text += line
  end
end
save_chunk("From the Heights", "Stanza #{stanza}", text)
