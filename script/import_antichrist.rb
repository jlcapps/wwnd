@work = Work.find_by_title("The Antichrist")

def save_chunk(section, text)
  p "save #{section}"
  chunk = Chunk.new(:title => section, :body => text, :work => @work)
  chunk.save!
end

p "create The Antichrist"
text = chapter = section = ""
File.open('script/files/the_antichrist.txt', 'r').each do |line|
  if line.strip! == "PREFACE"
    section = "Preface"
    text = ""
    next
  end
  if match = line.match(/(\d+)\.\z/)
    if !text.strip.empty?
      save_chunk(section, text)
    end
    text = ""
    section = "Section #{match[1]}"
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
