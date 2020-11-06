FactoryBot.define do

  factory :product do
    user_id               {1}
    title                 {"ニットのセーター"}
    explanation           {"今年の冬の新作"}
    price                 {2500}
    brand                 {"UNIQLO"}
    delivery_burden_id   {1}
    product_status_id     {1}
    estimated_shipping_id  {2}
    postal_prefectures_id {1}
    category
    after(:build) do |product|
      parent_category = create(:category)
      child_category = parent_category.children.create(name: "hello")      
      grand_child_category = child_category.children.create(name: "world")
      product.category_id = grand_child_category.id
    end
  end
end