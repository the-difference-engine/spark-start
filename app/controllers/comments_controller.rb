class CommentsController < ApplicationController

  def create
<<<<<<< c3e0880c73e8504750c524a48ccb3c5f6a1e5453
<<<<<<< e1f8c1d12567e7581b7e301a425438e5cc10b7a0
=======
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]

>>>>>>> attempt to add commenter user name
=======
>>>>>>> remove user id from comments
    @post = Post.find(params[:post_id])
    @comment = Comment.create(
      body: params[:body],
      post_id: @post.id,
<<<<<<< c3e0880c73e8504750c524a48ccb3c5f6a1e5453
<<<<<<< e1f8c1d12567e7581b7e301a425438e5cc10b7a0
=======
      user_id: @user_token
>>>>>>> attempt to add commenter user name
=======
>>>>>>> remove user id from comments
    )

    redirect_to request.referer
  end

end
