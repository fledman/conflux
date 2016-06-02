require 'forwardable'
require 'hydrangea/constants'

module Hydrangea
  class ManyNodes
    extend Forwardable
    include Enumerable

    def_delegators :@nodes, :[], :each

    { succeed: SUCCESS, fail: FAILURE, error: ERRORED }.each do |msg,state|
      define_method(msg) do |with, node_arg, *more|
        for_nodes(node_arg, more) do |node|
          @transform.transform(node: node, new_state: state, new_value: with)
        end
      end
    end

    def pass(node_arg, *more)
      for_nodes(node_arg, more){ |node| @transform.pass(node: node) }
    end

    private

    def for_nodes(node_arg, more)
      nodes = [node_arg] + more unless more.empty?
      nodes ||= case node_arg
        when :rest, 'rest' then @transform.untransformed
        when Set then node_arg.to_a
        when Array then node_arg
        else [node_arg]
      end
      nodes.each do |node|
        node.is_a?(Node) ? yield(node) : not_a_node_error(node)
      end
    end

    def not_a_node_error(node)
      raise ArgumentError, "expected a Node, got #{node.inspect}"
    end
  end
end
