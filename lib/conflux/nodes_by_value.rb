require 'conflux/many_nodes'

module Conflux
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
