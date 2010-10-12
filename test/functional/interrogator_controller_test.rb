require 'test_helper'

class InterrogatorControllerTest < ActionController::TestCase
  def setup
    # stub out Chunk#answer and Chunk##answer to route around problem with 
    # Thinking Sphinx
    def Chunk.answer(slug, question, chunk_id=nil)
      @chunk = Chunk.new(:title => "My title", 
                         :body => "what if truth were a woman?", 
                         :work => Author.find_by_slug("nietzsche").works.first)

      def @chunk.answer(snip="truth &#8230; woman")
        Answer.new("what if truth were a woman", snip).to_s
      end
      [@chunk]
    end
  end

  def teardown
    load "app/models/chunk.rb"
  end

  test "should get index" do
    get :index, :slug => "nietzsche"
    assert_response :success
  end

# XXX - TS currently not working in tests. See comment in test_helper.rb
#
#   test "should get index with question" do
#     ThinkingSphinx::Test.run do
#       get :index, :slug => "nietzsche", :question => "what is mystring"
#       assert_response :success
#     end
#   end

  # This uses the stub in setup because of prolem w/ Thinking Sphinx in tests
  test "should get index with question" do
    get :index, :slug => "nietzsche", :question => "is truth a woman?"
    assert_response :success
  end

  test "should assign author_name" do
    get :index, :slug => "nietzsche"
    assert assigns(:author_name)
  end

  test "should assigns photo" do
    get :index, :slug => "nietzsche"
    assert assigns(:photo)
  end

  test "should get bio" do
    get :bio, :slug => "nietzsche"
    assert_response :success
  end

  test "should assign title" do
    get :index, :slug => "nietzsche"
    assert assigns(:title)
  end

  test "should get root" do
    get :root
    assert_response :success
    assert assigns(:authors), "No @authors assigned!"
  end

  test "should get about" do
    get :about
    assert_response :success
  end
end
