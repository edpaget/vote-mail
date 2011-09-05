require 'mail'
require './processor'
require './config/grammar'

module MailParse
  class MailCommand
    def initialize(email)
      @poster = email.sender.first
      MailParse.read_body(email.body.decoded).each do |field|
      end
    end
  end
  def build(email)
  end

  def read_body(email_body)
    split_body = email_body.split(/\s|"([^"]*)"/)
  end
  
end
  
