#!/usr/bin/env escript

main([]) ->
  % odbc:start(),
  % {ok, Connection} = odbc:connect("DRIVER={MonetDB};Server=localhost;Port=50000;UID=monetdb;PWD=monetdb;DATABASE=pagoda-stats", []),
  % Now = current_time_string(),
  % Start = erlang:now(),
  % insert(Connection, Now, 1),
  % Stop = erlang:now(),
  % Diff = timer:now_diff(Stop, Start),
  % % Minutes = timer:minutes(Diff),
  % Seconds = Diff / 1000000,
  % io:format("~p seconds ~n", [Seconds]).
  io:format("~s~n", [current_time_string()]).


current_time_string() ->
  {{Year, Mon, Day}, {Hour, Min, Sec}} = erlang:universaltime(),
  Args = [Year, Mon, Day, Hour, Min, Sec],
  S = io_lib:format("~B-~2.10.0B-~2.10.0BT~2.10.0B:~2.10.0B:~2.10.0BZ", Args),
  lists:flatten(S).

insert(_Connection, _Now, 1000) ->
  ok;

insert(Connection, Now, Count) ->
  % Query = "INSERT INTO people VALUES ('tyler', 26, '" ++ current_time_string() ++ "')",
  Query = "INSERT INTO people VALUES ('tyler', 26, '" ++ Now ++ "')",
  odbc:sql_query(Connection, Query),
  insert(Connection, Now, Count +1).