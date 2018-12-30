require 'open-uri'
require 'pry'

def fetchds(url)
    fetch File.join(url, ".DS_Store")
end

def fetch(url)
    open(url) do |d|
        return d.read
    end
end

def analyze(blob)
    IO.popen("python Python-dsstore-master/stdin.py", "r+") do |a|
        a.write blob
        a.close_write
        cound = a.gets
        lines = []
        while line = a.gets
            lines << line.strip
        end
        return lines.sort.uniq
    end
end

def scrape(root)
    begin
        got = fetchds(root)
    rescue OpenURI::HTTPError => e
        p e
        return []  
    end
    
    subdirs = analyze(fetchds(root))
    next_level = subdirs.map do |sd|
        File.join root, sd
    end
end

targets = scrape "http://35.207.91.38/backup/"



MAXDEPTH = 3
MAXDEPTH.times do 
    next_targets = targets.map {|t| scrape t}.flatten
    p targets = next_targets
end