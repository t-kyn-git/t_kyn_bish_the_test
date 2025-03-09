# t_kyn_bish_the_test
public test
諸々の動作確認するためのモジュールを作成します。

* 目的
  * 近年、企業のビジネス変革が求められる時代となっており、DX推進を行う企業が増加している
  * 個人の得意分野のスキルアップと同時に、新しい知識を効率よく取得する必要がある
  * トライアンドエラーで動作確認を行いながら、仕組みを理解する

* 前提条件
  * 個人情報はアップロード禁止
  * データはオープンデータもしくは、Fakerを利用して作成
  * 仕組みを思いついたら即作成するスタイルのため、品質に拘らない

* 作成している内容について
  * 1) djangoアプリケーション開発
    * 運用フロー
      * Djangoアプリケーションの開発をVisual Studio code にて実装
      * コミット・Githubリポジトリにアップロード
      * Google Colaboratory上での動作確認
      * Visual Studio code → Github → GoogleColaboratoryというフローで迅速な開発を行います。
      * GoogleColaboratoryのファイルは特定のファイルを使用
        * django_hogehogehogeeeeeeeeee.ipynb
    * 応用
      * オープンデータ活用（検討中）
      * アルバムサーバとしての活用(**絶賛取組中**)
        * content/t_kyn_test_app/django_preinstall.sh
          * pip install django
        * python content/t_kyn_test_app/manage_t_kyn.py runserver
          * pythonアプリケーション実行
      * チャット（惜しいところまで✅）
        * 複数ユーザでリアルタイムでチャットするように同期する（❌）
      * Todo管理機能追加（✅）
      * お絵描き機能（❌）
      * 地図機能（✅）
      * 株価分析機能（❌）
      * スプレッドシート作成機能追加（❌）

  * 2) Webホスティング開発
    * HTML、CSS、Javascriptの動作確認
    * 

  * 3) Github Actionsの新規機能をお試し実行
    * プライベートリポジトリでは費用のかかる機能のお試し開発
    * Terrraform、AWSCLIでのLocalstackのIaC実装
    * https://spacelift.io/blog/terraform-best-practices

* メモ
  * 色々なことができそうなので、下記についても試す
    * Github Actions で、Localstackを動かす。
    https://qiita.com/damepo9696/items/fcf2af605b45bdf07b1a
    * Github ActionsでLocalstack動かす＋Terraform
    https://medium.com/@robbiedouglas/using-localstack-and-github-actions-to-test-terraform-aws-deployments-0a119dcff7c2
    * https://qiita.com/zero_046/items/f9641f4ef28f0783700e
    →書き方参考
    * https://qiita.com/WebEngrChild/items/e5e3031d93158507cd5d
    →Terraformを使う前に見ると少し理解が深まった。
      Providers、Resources、Variables、Outputs、Data Sources、Moduleは把握したほうがよさそう。
      Functionsは追々挙動を確認する。


