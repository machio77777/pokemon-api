
# Pokémon RestfulAPI By CakePHP3
ポケモンレーティング対戦で必要になる各種マスタのAPI提供

## 概要
- レスポンスはJSON形式で返却
- 必要な情報はGoutteでスクレイピング

## 環境構築
- composerインストール(パス通す)
- PHP開発環境導入(MAMP等)
- CakePHP3プロジェクト作成 
- gitignore編集

```linux
// CakePHP3インストール(xxxはプロジェクト名)
composer create-project --prefer-dist cakephp/app xxx

// Goutteインストール
composer require fabpot/goutte

// PHPUnitインストール
composer require --dev phpunit/phpunit:"^5.7|^6.0"

// MAMPでbakeエラーになる場合
ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock
```

## ディレクトリ構成

```
pokemon/
    ├ config            - 設定ファイル類
    └ src
        └ Command       - SQLファイル生成コマンド群
        └ Controller    - API
            └ Component - スクレイピング
        └ Model
            └ Entity    - エンティティー
            └ Table     - テーブル
```
## スクレイピング
Goutteサンプルプログラム
```php
// サンプル
$uri = 'https://yakkun.com/sm/move_list.htm?c=1';
$crawler = $this->client->request('GET', $uri);
$elements = $crawler->filter('table.center tr td')->each(function($element){
    return $element->text();
});
```

### 参考
- [ポケモン徹底攻略](https://yakkun.com/)
- [ポケモンwiki](https://wiki.xn--rckteqa2e.com/wiki/%E3%83%A1%E3%82%A4%E3%83%B3%E3%83%9A%E3%83%BC%E3%82%B8)
