require 'conflux/constants'

module Conflux
  class GraphPartition
    def initialize(state_arg)
      @lookup = ALL if state_arg == :all || state_arg == 'all'
      @lookup ||= Array(state_arg).reduce(Set.new) do |set,state|
        invalid_state_arg(arg) unless ALL.include?(state)
        set << state
      end
    end

    def select(graph)
      graph.each.select{ |node| @lookup.include?(node.state) }
    end

    def reject(graph)
      graph.each.reject{ |node| @lookup.include?(node.state) }
    end

    def invalid_state_arg(arg)
      raise ArgumentError, "not a valid graph state: #{arg.inspect}"
    end
  end
end
