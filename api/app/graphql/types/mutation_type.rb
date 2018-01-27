Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createItem, Types::ItemType do
  	description "creating a new todo"

  	argument :name, !types.String
  	argument :description, !types.String
    argument :category_id, !types.ID

  	resolve -> (obj, args, ctx) {
  		item = Item.new(args.to_h)
  		item.save
  		item
  	}

  end

  field :createCatogory, Types::CategoryType do
    description "creating a new category"

    argument :name, !types.String

    resolve -> (obj, args, ctx) {
      category = Category.new(args.to_h)
      category.save
      category
    }

  end

  field :updateCategory, Types::ItemType do
    description "updating a todo - add category"

    argument :id, !types.ID
    argument :category_id, !types.ID 

    resolve -> (obj, args, ctx) {
      item = Item.find(args[:id])
      item.update(args.to_h)
      item
    }
  end

  field :updateItem, Types::ItemType do
  	description "updating a todo"

  	argument :id, !types.ID
  	argument :name, !types.String
  	argument :description, !types.String
    argument :category_id, !types.ID

  	resolve -> (obj, args, ctx) {
  		item = Item.find(args[:id])
  		item.update(args.to_h)
  		item
  	}
  end

  field :deleteItem, Types::ItemType do 
  	description "deleting a todo"

  	argument :id, !types.ID

  	resolve -> (obj, args, ctx) {
  		item = Item.find(args[:id])
  		item.destroy
  		item
  	}
  end


  field :deleteCategory, Types::ItemType do 
    description "deleting a category"

    argument :id, !types.ID

    resolve -> (obj, args, ctx) {
      category = Category.find(args[:id])
      category.destroy
      category
    }
  end

end
