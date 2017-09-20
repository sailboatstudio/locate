Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user, Types::UserType do
    description "A single User"
    resolve ->(obj, args, ctx) { User.first }
  end

  field :users, types[Types::UserType] do
    description "All Users"
    resolve ->(obj, args, ctx) { User.all }
  end

end
