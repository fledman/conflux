require 'forwardable'
require 'conflux/constants'

module Conflux
  class SingleNode
    extend Forwardable

    attr_reader :node
    def_delegators :@node, :state, :value

    def initialize(transform, node)
      @transform, @node = transform, node
    end

    { succeed: SUCCESS, fail: FAILURE, error: ERRORED }.each do |msg,state|
      define_method(msg) do |with|
        @transform.transform(node: node, new_state: state, new_value: with)
      end
    end

    def pass
      @transform.pass(node: node)
    end
  end
end
