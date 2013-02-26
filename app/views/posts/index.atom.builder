atom_feed do |feed|
	feed.title "AKBlog Posts"
	feed.updated(@posts.first.created_at) if @posts.length > 0
	@posts.each do |post|
		feed.entry post do |entry|
			entry.title post.title
			entry.content content
			entry.author do |author|
				author.name post.author
			end
		end
	end
end
