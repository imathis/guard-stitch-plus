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
      @stitch_files = stitch_files
      write
    end

    def reload
      write
    end

    def run_all
      write
    end

    def run_on_removals(paths)
      if (paths & @stitch_files).size > 0
        write
      end
    end

    def run_on_additions(paths)
      @stitch_files = stitch_files
      if (paths & @stitch_files).size > 0
        write
      end
    end

    def run_on_changes(paths)
      @stitch_files = stitch_files
      if @options[:config] and paths.include? @options[:config]
        start
      elsif (paths & @stitch_files).size > 0
        write
      end
    end

    def write
      @stitcher.write
      ENV['GUARD_STITCH_PLUS_OUTPUT'] = @stitcher.last_write
    end

    private
    
    def stitch_files
      all_files = @stitcher.all_files
      ENV['GUARD_STITCH_PLUS_FILES'] = all_files.join(',')
      all_files
    end
  end
end

