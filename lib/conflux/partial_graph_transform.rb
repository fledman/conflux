require 'conflux/graph_transform'
require 'conflux/graph_partition'

module Conflux
  class PartialGraphTransform < GraphTransform
    def initialize(nodes, states)
      super(nodes)
      GraphPartition[states].reject(@before).each{ |n| pass(node: n) }
    end
  end
end
