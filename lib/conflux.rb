require "conflux/version"
require "conflux/constants"
require "conflux/node"
require "conflux/graph"
require "conflux/flow"

module Conflux
  def self.source(*values)
    Flow.new(
      Graph.new(
        values.map{ |v|
          Node.new(state: SUCCESS, value: v) }))
  end
end
