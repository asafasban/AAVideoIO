# Helpful utility functions

# Set the value of a field of a pointer
# Equivalent to s->name = value
function av_setfield{T}(s::Ptr{T}, name::Symbol, value)
    field = findfirst(fieldnames(T), name)
    byteoffset = fieldoffset(T, field)
    S = T.types[field]

    p = convert(Ptr{S}, s+byteoffset)
    a = unsafe_wrap(Array, p,1)
    a[1] = convert(S, value)
end
export av_setfield
function av_pointer_to_field{T}(s::Ptr{T}, name::Symbol)
    field = findfirst(fieldnames(T), name)
    byteoffset = fieldoffset(T, field)
    return s + byteoffset
end
export av_pointer_to_field
av_pointer_to_field(s::Array, name::Symbol) = av_pointer_to_field(pointer(s), name)

function open_stdout_stderr(cmd::Cmd)
    out = Base.PipeEndpoint()
    err = Base.PipeEndpoint()
    cmd_out = Base.PipeEndpoint()
    cmd_err = Base.PipeEndpoint()
    Base.link_pipe(out, true, cmd_out, false)
    Base.link_pipe(err, true, cmd_err, false)

    r = spawn(ignorestatus(cmd), (DevNull, cmd_out, cmd_err))

    Base.close_pipe_sync(cmd_out)
    Base.close_pipe_sync(cmd_err)

    # NOTE: these are not necessary on v0.4 (although they don't seem
    #       to hurt). Remove when we drop support for v0.3.
    Base.start_reading(out)
    Base.start_reading(err)
    return (out, err, r)
end

function readall_stdout_stderr(cmd::Cmd)
    (out, err, proc) = open_stdout_stderr(cmd)
    return (readstring(out), readstring(err))
end
export readall_stdout_stderr
