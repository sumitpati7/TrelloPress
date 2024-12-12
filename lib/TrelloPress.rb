# frozen_string_literal: true

require_relative "TrelloPress/version"

module TrelloPress
  class Error < StandardError; end
  # colors
  @red = "\e[31m"
  @green = "\e[32m"
  @yellow = "\e[33m"
  @blue = "\e[34m"
  @magenta = "\e[35m"

  def self.check_jekyll
    return false unless File.exist?("./Gemfile") && File.exist?("./index.md")

    true
  end

  def self.generate_plugin
    return unless check_jekyll

    content = File.read("./assets/txts/creator.txt")
    Dir.mkdir("_plugins") unless File.exist?("_plugins")
    File.open("./_plugins/creator.rb", "w+") { |f| f.write(content) }
  end

  def self.generate_workflows
    return unless check_jekyll

    content = File.read("./assets/txts/workflow.txt")
    Dir.mkdir(".github/workflows") unless File.exist?(".github/workflows")
    File.open("./.github/workflows/build.yml", "w+") { |f| f.write(content) }
  end
end
