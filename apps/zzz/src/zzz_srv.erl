-module(zzz_srv).
-behaviour(gen_server).
-define(SERVER, ?MODULE).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0, say_hello/0, stop/0]).

%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------


init(Args) ->
  {ok, Args}.

say_hello() -> 
  gen_server:call(?MODULE, hello).

handle_call(hello, _From, State) ->
  hello:hello(),
  io:format("Hello from zzz_srv!~n",[]),
  {reply, ok, State}.

% ------------------------------------------
% handle_call(_Request, _From, State) ->
%   io:format("Hello from zzz_srv!~n", []),
%   {reply, ok, State}. %;

% handle_call(_Request, _From, State) ->
%  Reply = ok,
%  {reply, Reply, State}.

stop() -> 
  gen_server:cast(?MODULE, stop).

handle_cast(stop, State) ->
  {stop, normal, State};

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

