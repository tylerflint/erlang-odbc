#!/usr/bin/env escript

main([]) ->
  odbc:start(),
  Start = erlang:now(),
  insert(1),
  Stop = erlang:now(),
  Diff = timer:now_diff(Stop, Start),
  % Minutes = timer:minutes(Diff),
  Seconds = Diff / 1000000,
  io:format("~p seconds ~n", [Seconds]).
  % io:format("~s~n", [current_time_string()]).


% current_time_string() ->
%   {{Year, Mon, Day}, {Hour, Min, Sec}} = erlang:universaltime(),
%   Args = [Year, Mon, Day, Hour, Min, Sec],
%   S = io_lib:format("~B-~2.10.0B-~2.10.0BT~2.10.0B:~2.10.0B:~2.10.0BZ", Args),
%   lists:flatten(S).

insert(1000) ->
  ok;

insert(Count) ->
  Fun = 
    fun() ->
      {ok, Connection} = odbc:connect("DRIVER={MonetDB};Server=localhost;Port=50000;UID=monetdb;PWD=monetdb;DATABASE=pagoda-stats", []),
      Query = "INSERT INTO people VALUES ('tyler', 26, '2011-11-21 21:20:48.000000')",
      % Query = "INSERT INTO people VALUES ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000'), ('tyler', 26, '2011-11-21 21:20:48.000000')",
      odbc:sql_query(Connection, Query)
    end,
  spawn(Fun),
  insert(Count +1).



