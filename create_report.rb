require 'thor'
require 'pry'

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

  #TODO コマンド名はいずれ変える。
  def nippo
    default_text =<<-EOS
# #{Time.now.strftime("%Y/%m/%d")}
## やったこと

## 今の気分など

    EOS
    create_file("#{Time.now.strftime("%Y%m%d")}.md", default_text)

  end
end

Copy_file.start
