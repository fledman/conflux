require 'set'

module Conflux
  SUCCESS = :success
  FAILURE = :failure
  ERRORED = :errored

  ALL = [SUCCESS, FAILURE, ERRORED].to_set.freeze
end
