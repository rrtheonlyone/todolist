Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allItems, !types[Types::ItemType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Item.all }
  end

  field :allCategories, !types[Types::CategoryType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Category.all }
  end

  field :item do
    type Types::ItemType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Item.find(args[:id])
    }
  end

  field :category do 
    type Types::CategoryType 
    argument :id, !types.ID 
    resolve -> (obj, args, ctx) {
      Category.find(args[:id])
    }
  end
  
end
