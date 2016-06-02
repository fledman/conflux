require "hydrangea/version"
require "hydrangea/constants"
require "hydrangea/node"
require "hydrangea/graph"
require "hydrangea/flow"

module Hydrangea
  def self.source(*values)
    Flow.new(
      Graph.new(
        values.map{ |v|
          Node.new(state: SUCCESS, value: v) }))
  end
end
