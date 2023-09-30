# アカウント作成フロー(ユーザー視点)

1. ShuttlePub上でアカウント作成を開始→ShuttlePubがメインと定めるEmumetにリダイレクト

2. Emumet

   - 既存のStellarアカウントを使う→StellarのIDをユーザーに聞いてリダイレクト(この時Stellar側ではEmumetをRFC7591のOAuthのクライアントとして登録する)
   - 新規Stellarアカウントを使う→EmumetのprimaryなStellarにリダイレクト

3. Stellar

   - 新規→Stellarの新規アカウント作成フローに入る
   - 既存→ログイン

   どちらからでもEmumetに戻す

4. Emumet→アカウント作成フロー→ShuttlePubに戻す

5. ShuttlePub→アカウントでログイン

## ログインフロー(ユーザー視点)

1. ShuttlePub上でログイン
   ID: @id@domain
2. ShuttlePubがdomainに対して問い合わせ(ここはShuttlePubになるので、primaryのEmumetを聞く)→リダイレクト
   - 疎通できなかった→ShuttlePub上でユーザーにEmumetのurlを要求してリトライさせる
3. Emumetがidを元に対象のStellarを探す→リダイレクト
   - 見つからなかった→ShuttlePubに知らんと返す
   - 複数あった
     - Stellarのドメインが一個だけ→そのStellarにリダイレクト
     - ドメインが複数→Stellarの一覧を表示して選択させる
   - 一個だけ
     対象のStellarにリダイレクト
4. Stellar上でログイン→Emumetにリダイレクト
5. Emumet上で返ってきたStellarアカウントとログインしようとしているEmumetアカウントが合致するか確認
   - 不正→3に戻る
   - 成功→Stellarにリダイレクト
6. Stellar ログイン成功 → ShuttlePubへリダイレクト
7. ShuttlePub ログイン成功