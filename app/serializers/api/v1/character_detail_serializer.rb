class Api::V1::CharacterDetailSerializer < ActiveModel::Serializer
  attributes :real_name, :concept, :description, :background, :metatype, :gender, :hair, :eyes, :ethnicity, :skin
end
