#!/usr/bin/env escript

main([]) ->
  odbc:start(),
  {ok, Connection} = odbc:connect("DRIVER={MonetDB};Server=localhost;Port=50000;UID=monetdb;PWD=monetdb;DATABASE=pagoda-stats", []),
  Start = erlang:now(),
  insert(Connection, 1),
  Stop = erlang:now(),
  Diff = timer:now_diff(Stop, Start),
  Minutes = timer:minutes(Diff),
  Seconds = timer:seconds(Diff),
  io:format("~s minutes and ~s seconds~n", [Minutes, Seconds]).


current_time_string() ->
  {{Year, Mon, Day}, {Hour, Min, Sec}} = erlang:universaltime(),
  Args = [Year, Mon, Day, Hour, Min, Sec],
  S = io_lib:format("~B-~2.10.0B-~2.10.0BT~2.10.0B:~2.10.0B:~2.10.0BZ", Args),
  lists:flatten(S).

insert(_Connection, 1000) ->
  ok;

insert(Connection, Count) ->
  Query = "INSERT INTO people VALUES ('tyler', 26, '" ++ current_time_string() ++ "')",
  odbc:sql_query(Connection, Query),
  insert(Connection, Count +1).