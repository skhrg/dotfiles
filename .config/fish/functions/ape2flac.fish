function ape2flac --description "Convert all ape files in directory (and subdirectories) to flac"
    for f in **.ape
        if [ (ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 $f) = "ape" ]
            ffmpeg -i $f (dirname $f)/(basename $f .ape).flac
            rm $f
        end
    end
end
