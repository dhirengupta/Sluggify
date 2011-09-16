module Sluggify
  extend ActiveSupport::Concern

  included do
    cattr_accessor :slug_field
  end

  def generate_slug
    new_slug = self.send(self.class.slug_field).downcase.strip.gsub(/[\W]+/,"-")
    new_slug_base = new_slug 
    if self.class.exists?(:slug_base => new_slug_base)
      existing_slug = self.class.where(:slug_base => new_slug_base).sort(:created_at).last.slug
      if (existing_slug.split("-").last.to_i == 0)
        self.slug = new_slug + "-1"
      else
        new_slug_index = (existing_slug.split("-").last.to_i) + 1
        new_slug_index = new_slug_index.to_s
        self.slug = new_slug + "-" + new_slug_index
      end
    else
      self.slug = new_slug
    end
    self.slug_base = new_slug_base
  end

  module ClassMethods
    def sluggify(field_name,options)
      self.slug_field=field_name
      options[:on].each do |cb|
        self.send(:"before_#{cb}", :generate_slug)
      end
    end
  end
end
