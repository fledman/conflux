require 'conflux/many_nodes'

module Conflux
  class ListOfNodes < ManyNodes
    def initialize(transform)
      @transform = transform
      @nodes = transform.untransformed
    end
  end
end
