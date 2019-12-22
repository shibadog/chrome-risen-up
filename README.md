# Chrome復活君

## overview

Windows10で、ChromeとSymantec Endpoint Protectionの特定バージョンの組み合わせに置いて、  
Chromeが起動時にCrashする事象が発生。

これの対策をするためのバッチを書いた。

## usage

* すべてのchromeプロセスを終了する。
* chrome復活.batを実行。
* 管理者権限の要求が出るため許可する。

以上。

## どのバージョンの組み合わせ？

|#|Windows|Chrome|Symantec|事象|
|----|----|----|----|----|
|1|Windows10 v1903-18362.535|78.0.3904.108|14.0.2332.0100|発生しない|
|2|Windows10 v1903-18362.535|79.0.3945.79|14.0.2332.0100|発生する|
|3|Windows10 v1903-18362.535|78.0.3904.108|14.2.4814.1101|発生しない|
|4|Windows10 v1903-18362.535|79.0.3945.79|14.2.4814.1101|発生しない|

## なぜ？

### ■Symantecの案内（日本語）

https://support.symantec.com/jp/ja/article.tech256047.html

### ■Chromium Issue 993099

https://bugs.chromium.org/p/chromium/issues/detail?id=993099
