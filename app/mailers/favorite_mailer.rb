class FavoriteMailer < ActionMailer::Base
  default from: "cmo871@gmail.com"

  def new_comment(user,post,comment)
  	@user = user
  	@post = post
  	@comment = comment

  	headers["Message-ID"] = "<comments/#{@comment.id}@chrismo.example>"
  	headers["In-Reply-To"] = "<post/#{@post.id}@chrismo.example>"
  	headers["References"] = "<post/#{@post.id}@chrismo.example>"

  	mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
