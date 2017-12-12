__precompile__(false)

module VideoIO

using FixedPointNumbers, ColorTypes, ImageCore

include("init.jl")

using AVUtil
using AVCodecs
using AVFormat
using SWScale

include("util.jl")
include("avio.jl")
include("testvideos.jl")
using .TestVideos

end # VideoIO
