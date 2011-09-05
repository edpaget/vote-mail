require './yaml_map'
require './models/posts'

module Processor

  class PostNotFound < StandardError
  end

  def post(hash)
    begin
      loaded_post = Post.load(hash[:post])
      loaded_post.up!
      loaded_post.save!
    rescue YAML_map::FileNotFound
      new_post = Post.new(hash)
      new_post.save!
    end    
  end

  def upvote(post_name)
    begin
      loaded_post = Post.load(post_name)
      loaded_post.up!
      loaded_post.save!
      loaded_post.upvotes
    rescue YAML_map::FileNotFound
      raise PostNotFound, "The requested Post could not be found."
    end
  end

  def downvote(post_name)
    begin
      loaded_post = Post.load(post_name)
      loaded_post.down!
      loaded_post.save!
      loaded_post.downvotes
    rescue YAML_map::FileNotFound
      raise PostNotFound, "The requested Post could not be found."
    end
  end
end

