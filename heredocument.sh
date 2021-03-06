#!/bin/bash


#catの出力結果を標準エラー出力へ
if [ $# -ne 1 ]; then
	cat <<_EOT_ 1>&2
引数を指定してください。

Usage: $0 param

_EOT_
	exit 1

fi

#[$]を表示したいとくは「\$」aのようにエスケープする
cat <<_EOT_
ヒアドキュメント中では変数も使用できます
\$は$1です

_EOT_




#終了文字をエスケープするとヒアドキュメント中の変数は展開されない
cat <<`_EOT_`
シングルクォートで終了文字を囲むと変数は無視されます
\$は$1です
`echo "コマンド置換も無視されます。"`

_EOT_





#終了文字をエスケープするとヒアドキュメント中の変数は展開されない
cat <<\_EOT_
シングルクォートで終了文字を囲むと変数は無視されます
\$は$1です
`echo "コマンド置換も無視されます。"`

_EOT_





#[<<-]とすると、ヒアドキュメント中の先頭にあるタブは無視される（スペースは無視されない）
cat <<-_EOT_
終了文字の前に「-」を指定すると、ヒアドキュメント中のタブは無視
	 
	
_EOT_

exit 0










