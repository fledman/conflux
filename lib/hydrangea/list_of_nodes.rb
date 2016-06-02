require 'hydrangea/many_nodes'

module Hydrangea
  class ListOfNodes < ManyNodes
    def initialize(transform)
      @transform = transform
      @nodes = transform.untransformed
    end
  end
end
