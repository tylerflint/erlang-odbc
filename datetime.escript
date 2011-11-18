#!/usr/bin/env escript

main([]) ->
  io:format("~s~n", [get_time()]).

get_time() ->
  T = erlang:universaltime(),
  iso_string(T).

iso_string({{Year, Mon, Day}, {Hour, Min, Sec}}) ->
    Args = [Year, Mon, Day, Hour, Min, Sec],
    S = io_lib:format("~B-~2.10.0B-~2.10.0BT~2.10.0B:~2.10.0B:~2.10.0BZ", Args),
    lists:flatten(S).