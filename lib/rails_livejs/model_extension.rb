module RailsLivejs::ModelExtension
  extend ActiveSupport::Concern
  @@models = []

  included do |args|
    after_save :live_update
    after_create :live_create
    after_destroy :live_destroy

    @@models << args

    def live_create
      WebsocketRails[:user].trigger(:create, {id: id, value: attributes})
    end

    def live_destroy
      WebsocketRails[:user].trigger(:destroy, {id: id})
    end

    def live_update
      attributes.each do |attribute, value|
        if send "#{attribute}_changed?"
          WebsocketRails[:user].trigger(:update, {id: live_update_key_for(attribute), value: value})
        end
      end
    end
  end

  def self.models
    @@models
  end

  def live_update_key_for method = nil
    "live_update_#{self.class.name.downcase}_#{id}#{('_' + method.to_s) if method}"
  end
end