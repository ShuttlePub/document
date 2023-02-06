### 参照したサイトとか

ActivityPubのサイト経由だとあんまり有用なものがなかったのでまとめとく

- https://www.w3.org/TR/activitystreams-vocabulary/  
  各通信のフォーマットがよくある形で載ってるやつ
- https://github.com/go-fed/activity  
  ActivityPubのgo実装 ドキュメントがしっかりしててよさげ

- https://blog.valerauko.net/2018/12/20/activitypub-with-the-sns-federation/
  実際に実装してみて苦労した話が載ってる。HTTP署名については規格と実際で違った話も載ってるので有用



# メモ程度の話

### 記事URL

misskeyは投稿記事のURLが`notes/{英数字ID}`で管理されており、他インスタンスの記事もこれに変換される  
一方mastodon系では`@userId/{数字ID}`で表現されおり、別インスタンスは`@userId@domain@{数字ID}`で表現される  
もちろん双方に互換性はないのでmisskeyからmastodonの記事を見るとmisskeyのURL形式になるしその逆ならmastodonの形式でmisskeyの記事が表示される。またmastodonでも別インスタンスから見ると同じ記事のIDが異なっていたので、おそらく記事を対象インスタンスから取得した段階で自分のインスタンスに保存していると思われる。  
`109800319794010952`と`109800319830667294`は同じ記事。ID前半がマッチしてるのでもしかするとuserIdとかと関連してる...?  
![](/img/post_id_difference.png)
