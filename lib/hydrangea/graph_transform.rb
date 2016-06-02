require 'hydrangea/graph'
require 'hydrangea/node'
require 'hydrangea/action_error'

module Hydrangea
  class GraphTransform
    def initialize(graph)
      @before = graph.to_set
      @after = Set.new
    end

    def transform(node:, new_state:, new_value:)
      mark_completed(node)
      @after << Node.new(state: new_state, value: new_value, previous: node)
      self
    end

    def pass(node:)
      mark_completed(node)
      @after << node
      self
    end

    def untransformed
      @before.to_a
    end

    def finish
      if @before.empty?
        Graph.new(@after)
      else
        size = @before.size
        raise ActionError, "REPLACE ME - NOT COMPLETE (#{size})"
      end
    end

    private

    def mark_completed(node)
      return if @before.delete?(node)
      raise ActionError, "REPLACE ME - ALREADY COMPLETE"
    end
  end
end
