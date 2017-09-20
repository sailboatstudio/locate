module Types

  CheckInType = GraphQL::ObjectType.define do
    name "CheckIn"
    description "CheckIns"

    # we list all of the fields in our CheckIn type from GraphQL
    field :id, !types.Int


  end

end