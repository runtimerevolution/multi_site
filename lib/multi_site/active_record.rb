module MultiSite

  class << self
    def current_site=(site)
      Thread.current[:site_id] = site.try(:id)
    end

    def current_site
      Site.find(Thread.current[:site_id]) if Thread.current[:site_id]
    end
  end

  module ActiveRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def has_site_scope
        def self.is_scoped_by_site?
          true
        end

        validates :site, :presence => true
        scope :on_site,
          -> { where(:site_id => MultiSite.current_site.try(:id)) }
        belongs_to :site, :class_name => "Site"
      end

      def is_scoped_by_site?
        false
      end
    end
  end
end
