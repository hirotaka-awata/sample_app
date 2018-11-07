class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|                         #一つのアクションから複数のフォーマットで返す  #条件にあう分岐内容を処理する
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy                                              #_methodにdeleteを保存しているため、unfollowを押すとdestroyアクションにひもづく（Webを支える技術）
    @user = Relationship.find(params[:id]).followed        #URLよりidのパラメータを送信している？
    current_user.unfollow(@user)
    #redirect_to @user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
