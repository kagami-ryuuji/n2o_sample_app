-module(index).
-compile(export_all).
-include_lib("kvs/include/entry.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

main() ->
  #dtl{file="layout", app=review}.

event(init) ->
  wf:update(view, render(baz));

event({show, baz}) ->
  wf:update(view, render(baz));

event({show, foo}) ->
  wf:update(view, render(foo));

event({show, bar}) ->
  wf:update(view, render(bar));

event(Event) ->
  io:format("Unknown event: ~p~n", [Event]),
  wf:update(view, #h1{ body = <<"Kretin">> }).

render(View) ->
  wf:wire(View:push_state()),
  #panel { id=view, class=[row], body = View:view() }.
