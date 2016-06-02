require 'set'
require 'forwardable'

module Hydrangea
  class Graph
    extend Forwardable

    def_delegators :@nodes, :each, :to_set

    def initialize(nodes)
      @nodes = case nodes
        when Set then nodes.to_a
        when Array then nodes.dup
        else nodes.each.to_a
      end
    end

  end
end
