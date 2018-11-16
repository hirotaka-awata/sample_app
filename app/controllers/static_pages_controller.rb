class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build                       # user.microposts.build userに紐づいた新しいMicropostオブジェクトを返す #buildメソッドはオブジェクトを返すがDBには反映され無い　#空で渡している
      @feed_items = current_user.feed.paginate(page: params[:page])     #デフォルトで[:page]には30を
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
