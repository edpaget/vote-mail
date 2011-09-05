require 'mail'
require './processor'
require './config/grammar'

module MailParse
  class MailCommand
    def initialize(email)
      @poster = email.sender.first
      @post = MailParse.parse_body
  def build(email)
  end

  def parse_body

  
end
  
