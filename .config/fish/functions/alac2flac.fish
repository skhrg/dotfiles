function alac2flac --description "Convert all alac m4a files in directory (and subdirectories) to flac"
    for f in **.m4a
        if [ (ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 $f) = "alac" ]
            ffmpeg -i $f (basename $f .m4a).flac
            rm $f
        end
    end
end
