GoodHairDay App

User:
- *user_name : string
- *first_name : string
- *email : string
- *password_digest : string
- hair_texture: string (select specific answer) 
- hair_structure: string (select specific answer)
- scalp_moist: string (select specific answer)

-- has_many: reviews
-- has_many: products
-- has_many: categories, through: products


Products:
- *product_name: string
- *product_brand: string (insert a new brand or pick from a list)
- *category_id: integer (select specific answer)

-- has_many: users
-- has_many: reviews
-- belongs_to: category

Review:
- animal_tested: boolean
- country_of_origin: string
- paraben: boolean
- silicone: boolean
- sulfate: boolean
- rating: integer (from 1 - 10 )
- comment: string
- user_id: integer
- product_id:integer

-- belongs_to: user
-- belongs_to: product
-- belongs_to: category, through: product

Category: From (https://www.luxyhair.com/blogs/hair-blog/hair-products-101)
- name: string (drop down menu select specific answer)
- Shampoo
- Conditioner
- Hair oils and serums
- Dry Shampoo
- Hair wax / Pomade
- Hair mousse
- Heat protectant
- Sea Salt
- Hairspray
- Curl Enhancing Cream

-- has_many: products
-- has_many: reviews, through: products
-- has_many: users, through: products

Users_Products:
- user_id
- product_id