-module(hello_world_erlydtl_handler).
-export([init/3, handle/2, terminate/2]).

init({tcp, http}, Req, _Opts) ->
    {ok, Req, undefined_state}.

handle(Req, State) ->
    {ok, Body} = erlyexample_dtl:render([{dynamic_var, erlang:localtime()}]),
    {ok, Reply} = cowboy_http_req:reply(200, [], Body, Req),
    {ok, Reply, State}.

terminate(_Req, _State) ->
    ok.
