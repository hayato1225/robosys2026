# robosys2026

![test](https://github.com/hayato1225/robosys2026/actions/workflows/test.yml/badge.svg)

このリポジトリはロボットシステム学の課題で利用するリポジトリです。

## equationコマンド

ガウス・ザイデル法を用いて、2元連立一次方程式の解を求めるコマンドです。

## インストール方法

以下のコマンドでリポジトリをクローンし、ディレクトリへ移動します。

```bash
$ git clone https://github.com/hayato1225/robosys2026.git
$ cd robosys2026
```

## 使い方

標準入力から `ax+by=c,dx+ey=f` の形式で2本の方程式を入力すると、標準出力に `x` と `y` の解を順に出力します。

```bash
$ echo "4x+1y=7,1x+3y=10" | ./equation
1.000000
3.000000
```

係数 `1` の省略や負の係数にも対応しています。

```bash
$ echo "3x + y = 5, x - 2y = -3" | ./equation
1.000000
2.000000
```

## 必要なソフトウェア

- Python
  - テスト済みバージョン: 3.10〜3.14

## テスト環境

- Ubuntu 24.04 LTS

## ライセンス

- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 TSUKADA HAYATO