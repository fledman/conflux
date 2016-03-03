require 'conflux/single_node'
require 'conflux/list_of_nodes'
require 'conflux/nodes_by_value'
require 'conflux/graph_partition'
require 'conflux/partial_graph_transform'

module Conflux
  class Flow
    def initialize(graph)
      @graph = graph
    end

    def map_each(states = SUCCESS)
      pgt = PartialGraphTransform.new(@graph, states)
      pgt.untransformed.each do |node|
        yield SingleNode.new(pgt, node)
      end
      self.class.new(pgt.finish)
    end

    def map_list(states = SUCCESS)
      pgt = PartialGraphTransform.new(@graph, states)
      yield ListOfNodes.new(pgt)
      self.class.new(pgt.finish)
    end

    def map_values(states = SUCCESS)
      pgt = PartialGraphTransform.new(@graph, states)
      yield NodesByValue.new(pgt)
      self.class.new(pgt.finish)
    end

    def sink(states = SUCCESS)
      GraphPartition.new(states).select(@graph)
    end
  end
end
