# README

## データベース定義の記入方法

column = カラム名

type = データ型

index = indexを貼るか?(貼るカラムの行にはyと記入)

null = nullを許可するか?(許可するカラムの行にははyと記入)

unique = テーブル内において値が単一か?(単一カラムの行にはyと記入)



## messagesテーブル



|colimn   | type      | index| null| unique|
|---------|-----------|------|-----|-------|
| body    | text      |      |     |       |
| image   | text      |      | y   |       |
| group_id| references| y    |     |       |
| user_id | references| y    |     |       |

###messagesテーブルに関するアソシエーション
> belongs_to :user

> belongs_to :group



## usersテーブル

| colimn  | type   | index| null| unique|
|---------|--------|------|-----|-------|
| name    | string | y    |     | y     |
| mail    | text   |      |     | y     |
| password| string |      |     |       |

### usersテーブルに関するアソシエーション
> has_many : messages,

> has_many :groups, through: :user_groups

> has_many :user_groups

### 追記(gem)

> deviseを使用してユーザー認証機能を作成する



## groupsテーブル

| colimn    | type       | index| null| unique|
|-----------|------------|------|-----|-------|
| name      | string     |      |     |       |


###Groupsテーブルに関するアソシエーション

> has_many :messages

> has_many :users, through: :user_groups

> has_many :user_groups




## group_usersテーブル


| colimn    | type       | index| null| unique|
|-----------|------------|------|-----|-------|
| user_id   | references | y    |     |       |
| group_id  | references | y    |     |       |

### group_usersテーブルに関するアソシエーション

> belongs_to : user

> belongs_to : group

