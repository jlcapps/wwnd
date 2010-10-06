require 'test_helper'

Struct.new("Excerpts", :body)

class Chunk
  def excerpts
    self.body = " 6. It has gradually become clear to me what every great philosophy up till now has consisted of--namely, the confession of its originator, and a species of involuntary and unconscious auto-biography; and moreover that the moral (or immoral) purpose in every philosophy has constituted the true vital germ out of which the entire plant has always grown. Indeed, to understand how the abstrusest metaphysical assertions of a philosopher have been arrived at, it is always well (and wise) to first ask oneself: \"What morality do they (or does he) aim at?\" Accordingly, I do not believe that an \"impulse to knowledge\" is the father of philosophy; but that another impulse, here as elsewhere, has only made use of knowledge (and mistaken knowledge!) as an instrument. But whoever considers the fundamental impulses of man with a view to determining how far they may have here acted as INSPIRING GENII (or as demons and cobolds), will find that they have all practiced philosophy at one time or another, and that each one of them would have been only too glad to look upon itself as the ultimate end of existence and the legitimate LORD over all the other impulses. For every impulse is imperious, and as SUCH, attempts to philosophize. To be sure, in the case of scholars, in the case of really scientific men, it may be otherwise--\"better,\" if you will; there there may really be such a thing as an \"impulse to knowledge,\" some kind of small, independent clock-work, which, when well wound up, works away industriously to that end, WITHOUT the rest of the scholarly impulses taking any material part therein. The actual \"interests\" of the scholar, therefore, are generally in quite another direction--in the family, perhaps, or in money-making, or in politics; it is, in fact, almost indifferent at what point of research his little machine is placed, and whether the hopeful young worker becomes a good philologist, a mushroom specialist, or a chemist; he is not CHARACTERISED by becoming this or that. In the philosopher, on the contrary, there is absolutely nothing impersonal; and above all, his morality furnishes a decided and decisive testimony as to WHO HE IS,--that is to say, in what order the deepest impulses of his nature stand to each other.\n\n"
    snippet = " &#8230;  germ out of which the entire <span class=\"match\">plant</span> has always grown. Indeed, to understand  &#8230;  to first ask oneself: \"What morality <span class=\"match\">do</span> they (or does he) aim at?\" Accordingly, <span class=\"match\">I</span> <span class=\"match\">do</span> not believe that an \" &#8230;  of small, independent clock-work, which, <span class=\"match\">when</span> well wound up, works away  &#8230; "
    Struct::Excerpts.new(snippet)
  end

  def self.search(question, query)
    query
  end
end


class ChunkTest < ActiveSupport::TestCase
  def setup
    @chunk = chunks(:one)
  end

  test "responds to display_title" do
    assert_respond_to @chunk, :display_title
  end

  test "display_title is properly formatted" do
    assert_equal "#{@chunk.work.title}/#{@chunk.title}",
      @chunk.display_title
  end

  test "should respond to per_page" do
    assert_respond_to @chunk, :per_page
    assert_equal 40, @chunk.per_page
  end

  test "Chunk should respond to answer" do 
    assert_respond_to Chunk, :answer
  end

  test "query properly constructed in Chunk##answer" do 
    # Chunk#answer stubbed out to return query hash
    query = Chunk.answer("nietzsche", "what is art?")
    assert_equal :any, query[:match_mode]
    assert_equal({ :slug => "nietzsche" }, query[:conditions])
    assert_equal 5, query[:per_page]
    assert_nil query[:with]
    query = Chunk.answer("nietzsche", "what is art?", 1)
    assert_equal({ :id => 1 }, query[:with])
  end

  test "instance should respond to answer" do 
    assert_respond_to @chunk, :answer
    assert @chunk.answer.is_a?(String)
  end
end
