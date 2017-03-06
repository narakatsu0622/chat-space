# README

## データベース定義の記入方法

column = カラム名

type = データ型

index = indexを貼るか?(貼るカラムの行にはyと記入)

null = nullを許可するか?(許可するカラムの行にははyと記入)

unique = テーブル内において値が単一か?(単一カラムの行にはyと記入)

外部キー = データ型がreference型の場合(テーブル名.カラム名)の形で記入


## messagesテーブル



|colimn   | type      | index| null| unique|外部キー|
|---------|-----------|------|-----|-------|------|
| id      | integer   |      | y   | y     |      |
| body    | text      |      | y   |       |
| image   | string    |      | y   |       |
| group_id| reference| y    |     |       |groups.id
| user_id | reference| y    |     |       |users.id

###messagesテーブルに関するアソシエーション
> belongs_to :user

> belongs_to :group



## usersテーブル

| colimn  | type   | index| null| unique|外部キー
|---------|--------|------|-----|-------|-----
| id      | integer| y    |     | y     |
| name    | text   |      |     | y     |
| mail    | text   |      |     | y     |
| password| text   |      |     |       |

###usersテーブルに関するアソシエーション
> has_many : messages

> has_and_belongs_to_many : groups


## groupsテーブル

| colimn    | type      | index| null| unique|外部キー
|-----------|-----------|------|-----|-------|-----
| id        | integer   | y    |     |       |
| user_id   | reference |      |     |       |users.id
| broup_name| text      |      |     |       |


###Groupsテーブルに関するアソシエーション

> has_and_belongs_to_many :users


## groups_usersテーブル


| colimn    | type      | index| null| unique|外部キー
|-----------|-----------|------|-----|-------|-----
| group_id  |  reference| y    |     |       |group.id
| user_id   |  reference| y    |     |       |users.id

### group_usersテーブルに関するアソシエーション


