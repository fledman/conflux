require 'set'

module Hydrangea
  SUCCESS = :success
  FAILURE = :failure
  ERRORED = :errored

  ALL = [SUCCESS, FAILURE, ERRORED].to_set.freeze
end
