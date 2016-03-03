module Conflux
  class Node
    attr_reader :state, :value, :previous, :first

    def initialize(state:, value:, previous: nil)
      @state, @value, @previous = state, value, previous
      @first = previous && previous.first || self
    end

    def history(&transform)
      node, history = self, []
      transform ||= :itself.to_proc
      loop do
        history << transform[node]
        break if node.previous.nil?
        node = node.previous
      end
      history
    end

    def to_a
      [state,value]
    end

    def to_s
      "(#{to_a.map(&:inspect).join(',')})"
    end

    def inspect
      "#<#{self.class.name}#{to_s}>"
    end
  end
end
