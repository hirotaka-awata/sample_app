class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|                                 #一つのアクションから複数のフォーマットで返す  #条件にあう分岐内容を処理する
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy                                              #_methodにdeleteを保存しているため、unfollowを押すとdestroyアクションにひもづく（Webを支える技術）
    @user = Relationship.find(params[:id]).followed        #URLよりidをパラメータとして受診している folowed：relationship.rbのbelog_toにより定義
    current_user.unfollow(@user)
    #redirect_to @user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js                                            #JavaScriptはコードオンデマンドを実現している。プログラムコードをサーバからダウンロードし、クライアント側で実行するアーキテクチャ
    end
  end
end

# respond_toについて
# Rails API ：Rails determines the desired response format from the HTTP Accept header submitted by the client.
# _follow.html.erbにて、remote:trueとし、HTML中でdate-remoteがtrueになっている場合、format.jsを実行する
# 
