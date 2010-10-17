@work = Work.find_by_title("Walking")

def save_chunk(section, text)
  p "save #{section}"
  chunk = Chunk.new(:title => section, :body => text, :work => @work)
  chunk.save
end

p "create Walking"
text = ""
section = 1
File.open('script/files/walking.txt', 'r').each do |line|
  if line.strip.blank?
    if !text.strip.empty?
      save_chunk(section.to_s, text)
    end
    text = ""
    section += 1
  else
    text += " #{line}"
  end
end
save_chunk(section, text)
