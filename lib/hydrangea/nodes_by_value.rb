require 'hydrangea/many_nodes'

module Hydrangea
  class NodesByValue < ManyNodes
    def initialize(transform)
      @transform = transform
      @nodes = transform.untransformed.reduce({}) { |h,n| h[n.value] = n; h }
    end

    def nodes
      map(&:last)
    end
  end
end
