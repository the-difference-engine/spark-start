module ApplicationHelper
	  def last_book
	  	@last_book ||= Book.last
	  end 
end
