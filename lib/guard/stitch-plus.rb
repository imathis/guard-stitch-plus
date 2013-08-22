require 'guard/guard'
require 'stitch-plus'

module Guard
  class Stitchplus < Guard

    def initialize (watchers=[], options={})
      super
      @options = options
    end

    def start
      @stitcher = ::StitchPlus.new(@options.merge({guard: true}))
      ENV['GUARD_STITCH_PLUS'] = 'true'
      ENV['GUARD_STITCH_PLUS_FILES'] = @stitcher.all_files.join(',')
      write
    end

    def reload
      write
    end

    def run_all
      write
    end

    def run_on_changes(paths)
      if @options[:config] and paths.include? @options[:config]
        start
      elsif (paths & @stitcher.all_files).size > 0
        write
      end
    end

    def write
      @stitcher.write
      ENV['GUARD_STITCH_PLUS_OUTPUT'] = @stitcher.last_write
    end
  end
end

