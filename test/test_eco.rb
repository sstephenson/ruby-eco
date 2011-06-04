require "eco"
require "stringio"
require "test/unit"

class EcoTest < Test::Unit::TestCase
  JS_FUNCTION_PATTERN = /^function\s*\(.*?\)\s*\{.*\}$/m

  def test_compile
    assert_match JS_FUNCTION_PATTERN, Eco.compile("Hello <%= @name %>")
  end

  def test_compile_with_io
    io = StringIO.new("Hello <%= @name %>")
    assert_equal Eco.compile("Hello <%= @name %>"), Eco.compile(io)
  end

  def test_compilation_error
    assert_raise ExecJS::ProgramError do
      Eco.compile("<%= foo")
    end
  end

  def test_context_for
    context = Eco.context_for("Hello <%= @name %>")
    assert_equal "Hello ", context.call("render")
    assert_equal "Hello Sam", context.call("render", :name => "Sam")
  end

  def test_render
    assert_equal "Hello ", Eco.render("Hello <%= @name %>")
    assert_equal "Hello Sam", Eco.render("Hello <%= @name %>", :name => "Sam")
  end

  def test_runtime_error
    context = Eco.context_for("Hello <% throw 'foo' %>")
    assert_raise ExecJS::ProgramError do
      context.call("render")
    end
  end
end
