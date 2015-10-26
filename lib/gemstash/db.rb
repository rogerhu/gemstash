require "gemstash"

module Gemstash
  # Module containing the DB models.
  module DB
    raise "Gemstash::DB cannot be loaded until the Gemstash::Env is available" unless Gemstash::Env.available?
    Sequel::Model.db = Gemstash::Env.current.db
    Sequel::Model.raise_on_save_failure = true
    Sequel::Model.plugin :timestamps, update_on_create: true
    autoload :Authorization, "gemstash/db/authorization"
  end
end
