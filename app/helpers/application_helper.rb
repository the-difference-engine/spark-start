module ApplicationHelper
	  def last_book
	  	if Book.last
	  	@last_book ||= Book.last.id
	  else
	  	@last_book = ""
	  end
	  end 
end
