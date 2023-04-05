function wav2flac --description "Convert all wav files in directory (and subdirectories) to flac"
    for f in **.wav
        ffmpeg -i $f (dirname $f)/(basename $f .wav).flac
        rm $f
    end
end
