class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :major
  has_one :instructor
end
