require 'mail'
require './processor'
require './config/grammar'

class MailCommand
  attr_accessor :command, :args, :command_grammar

  def initialize(email)
    body_tokens = read_body(email.body.decoded)
    @command_grammar = Grammar.const_get(body_tokens.slice!(0))
    @command = @command_grammar[:command]
    @args = parse_args(body_tokens)
  end

  def valid_arg?(arg)
    @command_grammar[:args].include? arg
  end

  def read_body(email_body)
    split_body = email_body.split(/\s|"([^"]*)"/).delete_if { |token| token == "" }
  end

  def exec_command(command)
    command[:command].call(command[:args])
  end

  def parse_args(tokens)
    tokens.map! { |item| if valid_arg? item then item.downcase.intern else item end}
    Hash[*tokens]
  end
end
