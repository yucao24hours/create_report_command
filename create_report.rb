require 'thor'
require 'pry'

# とりあえず、Thor を使ってファイルをコピーする練習
class Copy_file < Thor
  include Thor::Actions

  desc 'nippo', 'Create new nippo file including specify date'
  # Thor::Actions::source_root このクラスのルートディレクトリを設定する
  def self.source_root
    # __FILE__ 現在のソースファイル名（フルパスとは限らない）
    # File.dirname(filename) 引数 filename のうち、スラッシュより前を返却する（ディレクトリ名にあたるため）。
    # スラッシュがない場合はカレントディレクトリという判定になり、 . が返却される。
    File.dirname(__FILE__)
  end

  #TODO 日報だけじゃなくて週報・月報も src になりうるので、src は外から指定するようにしたい。それか、オプションにする。
  #TODO コマンド名はいずれ変える。
  #TODO IO#readlinesを使って日付を入れて返すみたいにしたい
  def nippo
    file = File.new("#{Time.now.strftime("%Y%m%d")}.md", 'w+')
    file.print <<-EOS
# #{Time.now.strftime("%Y/%m/%d")}
## やったこと

## 今の気分など

    EOS

    #copy_file "daily_report_template.md", "#{Time.now.strftime("%Y%m%d")}.md", 'w+'
    #f = File.open("#{Time.now.strftime("%Y%m%d")}.md", 'a+')
    #f.rewind
    #f.puts "f.lineno is #{f.lineno}"
  end
end

Copy_file.start
