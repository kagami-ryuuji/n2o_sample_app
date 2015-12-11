-module(index).
-compile(export_all).
-include_lib("kvs/include/entry.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

main() ->
  #dtl{file="layout", app=review}.

event(init) ->
  render(baz);

event({show, baz}) ->
  render(baz);

event({show, foo}) ->
  render(foo);

event({show, bar}) ->
  render(bar);

event(Event) ->
  io:format("Unknown event: ~p~n", [Event]),
  wf:update(view, #h1{ body = <<"Reload page please">> }).

render(View) ->
  wf:wire(View:push_state()),
  wf:update(view, #panel { id=view, class=[row], body = View:view() }).
