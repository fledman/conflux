require 'hydrangea/graph_transform'
require 'hydrangea/graph_partition'

module Hydrangea
  class PartialGraphTransform < GraphTransform
    def initialize(nodes, states)
      super(nodes)
      GraphPartition[states].reject(@before).each{ |n| pass(node: n) }
    end
  end
end
