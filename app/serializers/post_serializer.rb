class PostSerializer
  include JSONAPI::Serializer

  attributes :title, :content, :published, :created_at
  belongs_to :user
end
