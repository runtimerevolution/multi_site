# frozen_string_literal: true

# Module MultiSite
module MultiSite
  class << self
    def current_site=(site)
      RequestStore.store[:site_id] = site.try(:id)
    end

    def current_site
      Site.find(RequestStore.store[:site_id]) if RequestStore.store[:site_id]
    end

    def current_site_id
      RequestStore.store[:site_id]
    end
  end

  # Module ActiveRecord
  module ActiveRecord
    extend ActiveSupport::Concern

    # Module ClassMethods
    module ClassMethods
      def has_site_scope
        def self.is_scoped_by_site?
          true
        end

        validates :site, presence: true
        scope :on_site,  -> { where(site_id: MultiSite.current_site_id) }
        scope :for_site, ->(site) { where(site_id: site.try(:id)) }
        belongs_to :site, class_name: 'Site'

        before_validation -> { self.site ||= MultiSite.current_site }, on: :create
      end

      def is_scoped_by_site? # rubocop:disable Naming/PredicateName
        false
      end
    end
  end
end
