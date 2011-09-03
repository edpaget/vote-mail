class Post < YAML_map
  key :post
  fields :upvotes, :downvotes, :poster 
  
  def up!
    upvotes = if upvotes.nil? then 1 else upvotes + 1 end
  end

  def down!
    downvotes = if downvotes.nil? then 1 else upvotes + 1 end
  end
end
  
