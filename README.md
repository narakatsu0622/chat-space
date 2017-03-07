# README

## データベース定義

column = カラム名

type = データ型




## messagesテーブル



|colimn   | type      |index| null| unique|
|---------|-----------|------|-----|-------|
| body    | text      |      |false|       |
| image   | text      |      |    |       |
| group_id| references| yes  |false|       |
| user_id | references| yes  |false|       |

###messagesテーブルに関するアソシエーション
> belongs_to :user

> belongs_to :group



## usersテーブル

| colimn  | type   | index| null| unique|
|---------|--------|------|-----|-------|
| name    | string | yes  |false| true  |


### usersテーブルに関するアソシエーション
> has_many : messages,

> has_many :groups, through: :user_groups

> has_many :user_groups

### 追記(gem)

> deviseのデフォルト設定を使用して、テーブルを生成する。



## groupsテーブル

| colimn    | type       | index| null| unique|
|-----------|------------|------|-----|-------|
| name      | string     |      |false|       |


###Groupsテーブルに関するアソシエーション

> has_many :messages

> has_many :users, through: :user_groups

> has_many :user_groups




## group_usersテーブル


| colimn    | type       | index| null| unique|
|-----------|------------|------|-----|-------|
| user_id   | references | yes |false|       |
| group_id  | references | yes |false|       |

### group_usersテーブルに関するアソシエーション

> belongs_to : user

> belongs_to : group

