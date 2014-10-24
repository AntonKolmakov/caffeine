module Sluggable
  extend ActiveSupport::Concern

  included do
    class_attribute :sluggable_attribute

    extend FriendlyId

    validates :slug, presence: true

    slug_with :name

    def should_generate_new_friendly_id?
      (slug.blank? || sluggable_attribute_changed?) unless fix_slug?
    end

    def sluggable_attribute_changed?
      public_send("#{self.class.sluggable_attribute}_changed?")
    end
  end

  module ClassMethods
    def slug_with(attribute)
      self.sluggable_attribute = attribute

      friendly_id sluggable_attribute, use: %i(slugged history)
    end
  end
end
