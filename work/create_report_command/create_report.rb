require 'thor'
require 'pry'

# とりあえず、Thor を使ってファイルをコピーする練習
class Copy_file < Thor
  include Thor::Actions

  desc 'copy', 'copy file'
  # Thor::Actions::source_root このクラスのルートディレクトリを設定する
  def self.source_root
    # __FILE__ 現在のソースファイル名（フルパスとは限らない）
    # File.dirname(filename) 引数 filename のうち、スラッシュより前を返却する（ディレクトリ名にあたるため）。
    # スラッシュがない場合はカレントディレクトリという判定になり、 . が返却される。
    File.dirname(__FILE__)
  end

  #TODO 日報だけじゃなくて週報・月報も src になりうるので、src は外から指定するようにしたい。それか、オプションにする。
  def copy
    copy_file 'src.rb', 'desc.rb'
  end
end

Copy_file.start
