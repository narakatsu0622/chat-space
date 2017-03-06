# README

#データベース定義の記入方法
column = カラム名
type = データ型
index = indexを貼るか?(貼るカラムの行にはyと記入)
null = nullを許可するか?(許可するカラムの行にははyと記入)
unique = テーブル内において値が単一か?(単一カラムの行にはyと記入)

## messagesテーブル

|colimn  |type   |index|null|unique|
|body    |text   |     |y   |      |
|image   |string |     |y   |      |
|group_id|integer|y    |    |      |
|user_id |type   |y    |    |      |

## usersテーブル

|colimn  |type   |index|null|unique|
|user_id |integer|y    |    |y     |
|name    |text   |     |    |y     |
|mail    |text   |     |    |y     |
|password|text   |     |    |      |

## groupsテーブル

|colimn    |type   |index|null|unique|
|group_id  |integer|y    |    |      |
|user_id   |integer|     |    |      |
|broup_name|text   |     |    |      |
