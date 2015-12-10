-module(index).
-compile(export_all).
-include_lib("kvs/include/entry.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

main() ->
  #dtl{file="layout", app=review}.

event(init) ->
  wf:update(view, make_view(#panel {
    body=[
      #h1 { body = <<"Galleries">> },
      #link { url = "/foo", body="Foo" },
      #link { url = "/bar", body="Bar" }
    ]
  }));

event({client, {show, foo}}) ->
  View = make_view(foo:view()),
  wf:update(view, wf:render(View));

event({client, {show, bar}}) ->
  View = make_view(bar:view()),
  wf:update(view, wf:render(View));

event(Event) ->
  io:format("Unknown event: ~p~n", [Event]),
  wf:update(view, make_view(#h1{ body = <<"Kretin">> })).

make_view(View) ->
  #panel { id=view, body = View }.
