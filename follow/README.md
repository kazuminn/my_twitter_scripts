# description_follow.rb
自分がフォローしている友達の友達のディスクリプション(説明文)に
ある特定のキーワードが入っているとフォローするスクリプト

#環境
Ruby 2.0.0

#注意
* APIアクセス制限があるので、効率悪いです。
* 大量にフォローすると凍結されるかも
* 素人が、書いてるので自己責任で

#使い方
* まず、tokenをセット
* 琉大にフォローしたいキーワードを入れる
* TOEICにフォローしたい人のディスクリプションと絶対に被らないキーワードを入力
* 一時間毎にcronを設定すればいいと思う。
例えば
<pre>
0 */1 * * * /usr/bin/ruby ~/twitter.rb
</pre>