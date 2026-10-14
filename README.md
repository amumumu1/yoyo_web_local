# ローカル版ヨーヨー技能評価

## 起動（macOS）

Python 3.11 以降を用意し、`start.command` をダブルクリックするか、このフォルダで以下を実行します。

```sh
./start.command
```

初回は仮想環境 `.venv` の作成と依存パッケージのインストールにインターネット接続が必要です。
起動後は http://127.0.0.1:8000 を開きます。終了はターミナルで Ctrl+C。
ポートが使用中の場合は `PORT=8001 ./start.command` で変更できます。
HTML を直接開くのではなく、必ず上記の URL から利用してください。

## 使い方と保存先

- Google ログインは不要です。ローカルユーザーとして CSV 解析、結果保存、履歴、技能推移、アンケートを使います。
- 同梱の `3_acc2.csv` と `3_gyro2.csv` を CSV 入力に選ぶと動作確認できます。
- データはこのフォルダの `results.db` に保存されます。サーバー停止後、このファイルをコピーするとバックアップできます。
- サーバー上の既存履歴は自動では移行されません。複製元の DB は空でした。
- Web Bluetooth による計測は対応する Chrome/Edge とセンサーが必要です。実機接続は別途確認してください。
- 解析と履歴表示用の JavaScript は `vendor/` に同梱しています。YouTube 動画の再生だけはインターネット接続が必要です。
- 画面・API とも Flask が配信します。梶研サーバー、Cloudflare Pages、Firebase は利用しません。
- このパソコンだけで使う構成で、127.0.0.1 にのみ待ち受けます。利用者の認証や分離は行いません。

## 他の OS での起動

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python app.py
```

Windows では `python3` を `python`、`.venv/bin/python` を `.venv\Scripts\python.exe` に読み替えてください。
日本語グラフのフォントは OS から選びます。必要に応じて `YOYO_FONT_PATH` でフォントファイルを指定できます。
DB を別の場所に置く場合は `YOYO_DB_PATH` を指定できます。

## 同梱 JavaScript

- Chart.js 4.4.0 (MIT)
- canvas-confetti 1.6.0 (ISC)
- Three.js / STLLoader 0.128.0 (MIT)

取得元とライセンスは `vendor/SOURCES.md`、各ライセンスファイルを参照してください。
