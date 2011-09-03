class Post < YAML_map
  key :post
  fields :upvotes, :downvotes, :poster 
  
  def up!
    self.upvotes = if self.upvotes.nil? then 1 else self.upvotes + 1 end
  end

  def down!
    self.downvotes = if self.downvotes.nil? then 1 else self.downvotes + 1 end
  end
end
  
