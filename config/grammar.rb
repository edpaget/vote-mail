module Grammar
  extend Processor
  POST = lambda { |args| self.post }
  TITLE = :post
  SELF = :self
  URL = :url
  DOWNVOTE = lambda { |args| self.downvote }
  UPVOTE = lambda { |args| self.upvote }
end
