module ActionDispatch::Routing
  class Mapper
    def multi_site_scope(&block)
      scope ':multi_site', :constraints => MultiSiteConstraints.new do
        block.call
      end
    end
  end
end

class MultiSiteConstraints
  def matches?(request)
    Site.exists?(:id => request.path_parameters[:multi_site])
  end
end
