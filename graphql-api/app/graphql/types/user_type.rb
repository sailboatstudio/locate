module Types
  UserType = GraphQL::ObjectType.define do
    name "User"
    description "Some user..."

    field :id, !types.Int
    field :firstName, !types.String, property: :first_name

  end
end