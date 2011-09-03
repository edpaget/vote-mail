require './yaml_map'
require './models/posts'

module Processor

  class PostNotFound < StandardError
  end

  def post(hash)
    begin
      loaded_post = Post.load(hash[:post])
      loaded_post.up
      loaded_post.save!
    rescue Errno::ENOENT
      new_post = Post.new(:post => hash[:post],
                          :poster => hash[:sender])
      new_post.save!
    end    
  end

  def upvote(post_name)
    begin
      loaded_post = Post.load(post_name)
      loaded_post.up
      loaded_post.save!
    rescue Errno::ENOENT
      raise PostNotFound, "The requested Post could not be found."
    end
  end

  def downvote(post_name)
    begin
      loaded_post = Post.load(post_name)
      loaded_post.down
      loaded_post.save!
    rescue Errno::ENOENT
      raise PostNotFound, "The requested Post could not be found."
    end
  end
end

