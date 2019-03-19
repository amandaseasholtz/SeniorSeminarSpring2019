class SayController < ApplicationController
    
    def hello
        @time = Time.now
    end

    def goodbye
    end

    def homepage
    end

    def filenames
        @files = Dir.glob('*')
    end

    private

    def time_now
        @time = Time.now
    end
end