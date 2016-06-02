require 'hydrangea/single_node'
require 'hydrangea/list_of_nodes'
require 'hydrangea/nodes_by_value'
require 'hydrangea/graph_partition'
require 'hydrangea/partial_graph_transform'

module Hydrangea
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
      GraphPartition[states].select(@graph)
    end
  end
end
