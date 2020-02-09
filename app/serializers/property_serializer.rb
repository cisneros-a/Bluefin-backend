class PropertySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :uploads, 

  def uploads
    return unless object.uploads.attached?
    object.uploads.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: uploads_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end 

  def uploads_url()
    url_for(object.uploads)
  end 
end
