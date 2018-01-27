Types::ItemType = GraphQL::ObjectType.define do
  name 'Item'

  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String

  field :updated_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.updated_at.to_i
    }
  end

  field :created_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.created_at.to_i
    }
  end

  field :category, -> {Types::CategoryType}

  field :completed_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.completed_at.to_i
    }
  end

end