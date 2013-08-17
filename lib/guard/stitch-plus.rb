require 'guard/guard'
require 'stitch-plus'

module Guard
  class Stitchplus < Guard

    def initialize (watchers=[], options={})
      super
      @stitcher = ::StitchPlus.new(options)
      @stitcher.set_options({guard: true})
    end

    def start
      @stitcher.compile
    end

    def reload
      @stitcher.compile
    end

    def run_all
      @stitcher.compile
    end

    def run_on_changes(_)
      @stitcher.compile
    end
  end
end

