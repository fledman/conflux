require 'hydrangea/constants'

module Hydrangea
  class GraphPartition
    def self.[](state_arg)
      @instances ||= {}
      @instances[state_arg] ||= new(state_arg)
    end

    private_class_method :new

    def initialize(state_arg)
      @lookup = ALL if state_arg == :all || state_arg == 'all'
      @lookup ||= Array(state_arg).reduce(Set.new) do |set,state|
        invalid_state_arg(state) unless ALL.include?(state)
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
