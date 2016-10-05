require 'test_helper'

class InitializerTest < Minitest::Test

  def test_if_shell_is_zsh_it_should_be_detected
    ENV['SHELL'] = '/bin/zsh'

    initializer = Annoyme::Initializer.new
    shell_var = initializer.instance_variable_get('@shell')
    file_var = initializer.instance_variable_get('@file')

    assert_equal :zsh, shell_var
    assert file_var.end_with?('.zshrc')
  end

  def test_if_shell_is_bash_it_should_be_detected
    ENV['SHELL'] = '/bin/bash'

    initializer = Annoyme::Initializer.new
    shell_var = initializer.instance_variable_get('@shell')
    file_var = initializer.instance_variable_get('@file')

    assert_equal :bash, shell_var
    assert file_var.end_with?('.bashrc')
  end

  def test_if_shell_is_unknown_an_exception_should_be_raised
    ENV['SHELL'] = '/bin/unknown'

    assert_raises Annoyme::Error::ShellNotSupportedError do
      Annoyme::Initializer.new
    end
  end

end
