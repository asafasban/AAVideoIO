# Julia wrapper for header: /usr/local/include/libavutil/threadmessage.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


export
    av_thread_message_queue_alloc,
    av_thread_message_queue_free,
    av_thread_message_queue_send,
    av_thread_message_queue_recv,
    av_thread_message_queue_set_err_send,
    av_thread_message_queue_set_err_recv,
    av_thread_message_queue_set_free_func,
    av_thread_message_flush


function av_thread_message_queue_alloc(mq,nelem::Integer,elsize::Integer)
    ccall((:av_thread_message_queue_alloc,libavutil),Cint,(Ptr{Ptr{AVThreadMessageQueue}},UInt32,UInt32),mq,nelem,elsize)
end

function av_thread_message_queue_free(mq)
    ccall((:av_thread_message_queue_free,libavutil),Void,(Ptr{Ptr{AVThreadMessageQueue}},),mq)
end

function av_thread_message_queue_send(mq,msg,flags::Integer)
    ccall((:av_thread_message_queue_send,libavutil),Cint,(Ptr{AVThreadMessageQueue},Ptr{Void},UInt32),mq,msg,flags)
end

function av_thread_message_queue_recv(mq,msg,flags::Integer)
    ccall((:av_thread_message_queue_recv,libavutil),Cint,(Ptr{AVThreadMessageQueue},Ptr{Void},UInt32),mq,msg,flags)
end

function av_thread_message_queue_set_err_send(mq,err::Integer)
    ccall((:av_thread_message_queue_set_err_send,libavutil),Void,(Ptr{AVThreadMessageQueue},Cint),mq,err)
end

function av_thread_message_queue_set_err_recv(mq,err::Integer)
    ccall((:av_thread_message_queue_set_err_recv,libavutil),Void,(Ptr{AVThreadMessageQueue},Cint),mq,err)
end

function av_thread_message_queue_set_free_func(mq,free_func)
    ccall((:av_thread_message_queue_set_free_func,libavutil),Void,(Ptr{AVThreadMessageQueue},Ptr{Void}),mq,free_func)
end

function av_thread_message_flush(mq)
    ccall((:av_thread_message_flush,libavutil),Void,(Ptr{AVThreadMessageQueue},),mq)
end
