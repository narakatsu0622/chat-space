# README

## データベース定義の記入方法

column = カラム名

type = データ型

index = indexを貼るか?(貼るカラムの行にはyと記入)

null = nullを許可するか?(許可するカラムの行にははyと記入)

unique = テーブル内において値が単一か?(単一カラムの行にはyと記入)

外部キー = データ型がpreference型の場合(テーブル名.カラム名)の形で記入


## Messagesテーブル



|colimn   | type      | index| null| unique|外部キー|
|---------|-----------|------|-----|-------|------|
| id      | integer   |      | y   | y     |      |
| body    | text      |      | y   |       |
| image   | string    |      | y   |       |
| group_id| preference| y    |     |       |Groups.group_id
| user_id | preference| y    |     |       |Users.user_id

###Messagesテーブルに関するアソシエーション
> Message belongs to user

> Message belongs to group



## Usersテーブル
>
| colimn  | type   | index| null| unique|外部キー
|---------|--------|------|-----|-------|-----
| user_id | integer| y    |     | y     |
| name    | text   |      |     | y     |
| mail    | text   |      |     | y     |
| password| text   |      |     |       |

###Usersテーブルに関するアソシエーション
> User has many Messages
>
> User has many throuth Groups

## Groupsテーブル
>
| colimn    | type      | index| null| unique|外部キー
|-----------|-----------|------|-----|-------|-----
| group_id  | integer   | y    |     |       |
| user_id   | preference|      |     |       |Users.user_id
| broup_name| text      |      |     |       |

###Groupsテーブルに関するアソシエーション

> Group has many Messages

> Group has many through Users



