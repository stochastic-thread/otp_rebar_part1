-module(hello).
-export([hello/0]).

hello() -> 
	io:format("Hello from zzz_lib!~n",[]).