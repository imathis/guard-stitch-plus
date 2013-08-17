require 'guard/guard'
require 'stitch-plus'

module Guard
  class Stitchplus < Guard

    def initialize (watchers=[], options={})
      super
      @stitcher = ::StitchPlus.new(options.merge({guard: true}))
    end

    def start
      @stitcher.write
    end

    def reload
      @stitcher.write
    end

    def run_all
      @stitcher.write
    end

    def run_on_changes(_)
      @stitcher.write
    end
  end
end

