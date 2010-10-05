@work = Work.find_by_title("The Case of Wagner")

def save_chunk(section, text)
  p "save #{section}"
  chunk = Chunk.new(:title => section, :body => text, :work => @work)
  chunk.save!
end

p "create The Case of Wagner"
text = chapter = section = ""
File.open('script/files/wagner.txt', 'r').each do |l|
  line = l.strip
  if match = line.match(/(^[A-Z ]{2,})\.?\z/)
    if !text.strip.empty?
      save_chunk(section, text)
    end
    text = section = ""
    section = "#{match[1].downcase.titlecase}"
    next
  elsif match = line.match(/^(\d+)\.?$/)
    if !text.strip.empty?
      save_chunk(section, text)
    end
    text = section = ""
    section = "Section #{match[1]}"
    next
  end
  if !line.empty?
    text += " #{line}"
  else
    text += "\n\n"
  end
end
save_chunk(section, text)
