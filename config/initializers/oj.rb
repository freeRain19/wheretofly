# frozen_string_literal: true

require 'oj'

Oj.mimic_JSON # way to monkeypatch JSON lib behavior to use Oj
Oj.default_options = { mode: :object, symbol_keys: true }