## userテーブル 
|Column|Type|Options| 
|------|----|-------| 
|name|string|null: false| 
|email|string|null: false| 
|address|string|null: false| 
|password|string|null: false| 
 
### Association 
- has_many :pays
- has_many :items
 
## itemテーブル 
|Column|Type|Options| 
|------|----|-------| 
|name|strings|null: false| 
|img|text|null: false| 
|price|int|null: false| 
|user_id|integer|null: false, foreign_key: true| 
|condition|string|null: false| 
|size|string|null: false| 
|way|string|null: false| 
|date|string|null: false| 
 
### Association 
- belongs_to :user 
- has_many :categories,through:items_categories 
- belongs_to:brand
 
## payテーブル 
|Column|Type|Options| 
|------|----|-------| 
|user_id|integer|null: false, foreign_key: true| 
|id|integer|null: false| 
|card_id|integer|null: false| 

### Association 
- belongs_to: user

## categoryテーブル 
|Column|Type|Options| 
|------|----|-------| 
|id|integer|null: false| 
|name|string|null: false|
|parent_id|integer|null: false|
|item_id|integer|null: false|
|brand_id|integer|null: false|

### Association 
- has_many :items
- has_many  :items, through:items_categories
- has_many :brands, through:categories_brands 
## items_categoriesテーブル 
|Column|Type|Options| 
|------|----|-------| 
|id|integer|null: false, foreign_key: true| 
|item_id|integer|null: false, foreign_key: true| 
|category_id|integer|null: false, foreign_key: true|

### Association 
- belongs_to :item
- belongs_to : category 
## brandテーブル 
|Column|Type|Options| 
|------|----|-------| 
|name|string|null: false| 
|item_id|integer|null: false, foreign_key: true| 
|id|integer|null: false, foreign_key: true| 
|categry_id|integer|null: false, foreign_key: true|

### Association 
- has_many :items
- has_many : categories, through:categories_brands

## categories_brandsテーブル 
|Column|Type|Options| 
|------|----|-------| 
|id|integer|null: false, foreign_key: true| 
|category_id|integer|null: false, foreign_key: true| 
|item_id|integer|null: false, foreign_key: true|
|name|string|null: false|

### Association 
- belongs_to :category
- belongs_to : brand 
