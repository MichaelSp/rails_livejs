module RailsLivejs::ViewHelper
  def self.live *args
    arg = args.shift
    case arg
      when Symbol
        tag_type = arg
        model = args.shift
      when ActiveRecord::Base
        model = arg
        tag_type = :span
      else
        raise ArgumentError, 'First argument is none of type Symbol or ActiveRecord::Base!'
    end
    attrib = args.shift || :name
    html_attributes = args.shift || {}
    html_attributes.merge!({data: {live_model: model.class.name.downcase, live_id: model.id, live_attribute: attrib}})
    content_tag tag_type, html_attributes do
      model.send attrib
    end
  end
end