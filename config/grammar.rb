module Grammar
  extend Processor
  POST = {:command => lambda { |args| self.post },
          :args => ['SELF', 'URL', 'TITLE']}
  DOWNVOTE = { :command => lambda { |args| self.downvote },
               :args => ['POST']}
  UPVOTE = { :command => lambda { |args| self.upvote },
             :args => ['POST']}
end
