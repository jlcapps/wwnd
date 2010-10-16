@work = Work.find_by_title("Civil Disobedience")

def save_chunk(section, text)
  p "save #{section}"
  chunk = Chunk.new(:title => section, :body => text, :work => @work)
  chunk.save
end

p "create Civil Disobedience"
text = ""
section = 1
File.open('script/files/civil_disobedience.txt', 'r').each do |line|
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
